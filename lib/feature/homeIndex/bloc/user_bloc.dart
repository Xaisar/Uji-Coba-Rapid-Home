import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../authentication/model/session_token_model.dart';
import '../../authentication/model/user_validate_model.dart';
import '../model/get_user_response_model.dart';
import '../model/user_model.dart';
import '../service/home_index_api.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});

    on<InitialUserEvent>(initialUser);
  }

    Future<void> initialUser(InitialUserEvent event, Emitter<UserState> emit) async {
    emit(InitialUserProccesState());

    SessionToken? sessionToken;
    UserValidate? user;

    await SharedPrefUtils().getSession().then((sessionTokenValue) async{
      await SharedPrefUtils().getUser().then((userValue) async {
        if(sessionTokenValue != null && userValue != null){
          sessionToken = SessionToken.fromJson(json.decode(sessionTokenValue));
          user = UserValidate.fromJson(json.decode(userValue));

          try{
            GetUserResponse getUserResponse = await HomeIndexApi().userService(sessionToken!.accesToken, user!.id);

            if(getUserResponse.statusResponse != null) { 
              if(getUserResponse.statusResponse!.code == 200) {

                SharedPrefUtils().storedUser(json.encode(getUserResponse.data!.user.toJson()));

                emit(InitialUserSuccesState(getUserResponse.data!.user));
              } else if (getUserResponse.statusResponse!.code == 401) {
                emit(UserExpiredTokenState());               
              } else {
                emit(InitialUserFailureState(getUserResponse.statusResponse!.message));
              }
            } else {
              emit(const InitialUserFailureState("Can'get data from server"));
            }
          } catch (error) {
            debugPrint(error.toString());
            emit(InitialUserFailureState(error.toString()));
          }
        } else {
          emit(const InitialUserFailureState("Can'get data from memory"));
        }
      });
    });
  }
}
