import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
import '../../../authentication/model/user_model.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';

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

    User user = User(id: "", globalId: "", name: "", email: "", customers: []);
    int indexCustomer = 0;

    await SharedPrefUtils().getUser().then((userValue) async {
      await SharedPrefUtils().getCurrentCustomer().then((indexCustomerValue) async {
        if (userValue != null){
          user = User.fromJson(json.decode(userValue));

          if(indexCustomerValue != null){
            if(user.customers.length == indexCustomerValue + 1){
              indexCustomer = indexCustomerValue;
            } else {
              indexCustomer = 0;
            }
          } else {
            indexCustomer = 0;
          }

          emit(InitialHomeSuccesState(user, indexCustomer));
        } else {
          emit(const InitialHomeFailureState("Failed get User data"));
        }
      });
    });
  }

  Future<void> onRefreshHome(OnRefreshHomeEvent event, Emitter<HomeState> emit) async {}
}
