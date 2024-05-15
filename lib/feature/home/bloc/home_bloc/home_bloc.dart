import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
import '../../../authentication/model/session_token_model.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../authentication/model/user_validate_model.dart';
import '../../model/get_user_response_model.dart';
import '../../model/user_model.dart';
import '../../service/home_api.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    
    on<InitialHomeEvent>(initialHome);

    on<OnRefreshHomeEvent>(onRefreshHome);
  }

  Future<void> initialHome(InitialHomeEvent event, Emitter<HomeState> emit) async {
    emit(InitialHomeProccesState());

    SessionToken? sessionToken;
    UserValidate? user;
    int indexCustomer = 0;

    await SharedPrefUtils().getSession().then((sessionTokenValue) async{
      await SharedPrefUtils().getUser().then((userValue) async {
        await SharedPrefUtils().getCurrentCustomer().then((indexCustomerValue) async {
          if(sessionTokenValue != null && userValue != null){
            sessionToken = SessionToken.fromJson(json.decode(sessionTokenValue));
            user = UserValidate.fromJson(json.decode(userValue));

            try{
              GetUserResponse getUserResponse = await HomeApi().userHomeService(sessionToken!.accesToken, user!.id);

              if(getUserResponse.statusResponse != null) { 
                if(getUserResponse.statusResponse!.code == 200) {

                  if(indexCustomerValue != null){
                    if(getUserResponse.data!.user.customers.length == indexCustomerValue + 1){
                      indexCustomer = indexCustomerValue;
                    } else {
                      indexCustomer = 0;
                    }
                  } else {
                    indexCustomer = 0;
                  }
                  SharedPrefUtils().storedUser(json.encode(getUserResponse.data!.user.toJson()));

                  emit(InitialHomeSuccesState(getUserResponse.data!.user, indexCustomer));
                } else {
                  emit(InitialHomeFailureState(getUserResponse.statusResponse!.message));
                }
              } else {
                emit(const InitialHomeFailureState("Can'get data from server"));
              }
            } catch (error) {
              debugPrint(error.toString());
              emit(InitialHomeFailureState(error.toString()));
            }
          } else {
            emit(const InitialHomeFailureState("Can'get data from memory"));
          }
        });
      });
    });
  }

  Future<void> onRefreshHome(OnRefreshHomeEvent event, Emitter<HomeState> emit) async {
    emit(OnRefreshHomeProccesState());

    SessionToken? sessionToken;
    UserValidate? user;
    int indexCustomer = 0;

    await SharedPrefUtils().getSession().then((sessionTokenValue) async{
      await SharedPrefUtils().getUser().then((userValue) async {
        await SharedPrefUtils().getCurrentCustomer().then((indexCustomerValue) async {
          if(sessionTokenValue != null && userValue != null){
            sessionToken = SessionToken.fromJson(json.decode(sessionTokenValue));
            user = UserValidate.fromJson(json.decode(userValue));

            try{
              GetUserResponse getUserResponse = await HomeApi().userHomeService(sessionToken!.accesToken, user!.id);

              if(getUserResponse.statusResponse != null) { 
                if(getUserResponse.statusResponse!.code == 200) {

                  if(indexCustomerValue != null){
                    if(getUserResponse.data!.user.customers.length == indexCustomerValue + 1){
                      indexCustomer = indexCustomerValue;
                    } else {
                      indexCustomer = 0;
                    }
                  } else {
                    indexCustomer = 0;
                  }
                  SharedPrefUtils().storedUser(json.encode(getUserResponse.data!.user.toJson()));

                  emit(OnRefreshHomeSuccesState(getUserResponse.data!.user, indexCustomer));
                } else {
                  emit(OnRefreshHomeFailureState(getUserResponse.statusResponse!.message));
                }
              } else {
                emit(const OnRefreshHomeFailureState("Can'get data from server"));
              }
            } catch (error) {
              debugPrint(error.toString());
              emit(OnRefreshHomeFailureState(error.toString()));
            }
          } else {
            emit(const OnRefreshHomeFailureState("Can'get data from memory"));
          }
        });
      });
    });
  }
}
