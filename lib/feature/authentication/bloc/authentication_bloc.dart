import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/logout_response_model.dart';
import '../model/user_validate_model.dart';
import '../service/authentication_api.dart';
import '../model/session_token_model.dart';
import '../../../utils/shared_preferences_utils/shared_preferences_utils.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUnknownState()) {
    on<AuthenticationEvent>((event, emit) {
      emit(AuthenticationUnknownState());
    });

    on<InitialApplicationEvent>(initialApplication);

    on<IsFirstTimeDoneEvent>((event, emit) {
      SharedPrefUtils().storedFirstTime(true);
      emit(AuthenticationUnAuthenticationState());
    });

    on<UnAuthenticationEvent>(unAuthentication);

     on<IsAuthenticationEvent>((event, emit) {
      emit(AuthenticationAuthenticationState());
    });

    on<IsLogoutEvent>(logout);
  }

  Future<void> initialApplication(InitialApplicationEvent event, Emitter<AuthenticationState> emit) async {
   
    await SharedPrefUtils().getFirstTime().then((value) async {
      if(value == null){
        emit(AuthenticationIsFirstState());
      } else {
        await SharedPrefUtils().getSession().then((value) async{
          if(value != null){
            SessionToken sessionToken = SessionToken.fromJson(json.decode(value));
            if(sessionToken.expiredDate.isBefore(DateTime.now())) {
              emit(AuthenticationUnAuthenticationState());
            } else {
              await SharedPrefUtils().getUser().then((value) {
                if (value != null) {
                  UserValidate user = UserValidate.fromJson(json.decode(value));
                  debugPrint(user.customers.length.toString());

                  if(user.customers.isEmpty){
                    emit(UserFoundWithNoCustomerState());
                  } else {
                    emit(UserFoundWithCustomerState());
                  }
                } else {
                  emit(AuthenticationUnAuthenticationState());
                }
            });
            }
          } else {
            emit(AuthenticationUnAuthenticationState());
          }
        });
      }
    });
  } 

  Future<void> unAuthentication(UnAuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    await SharedPrefUtils().removeSession();
    await SharedPrefUtils().removeUser();

    emit(AuthenticationUnAuthenticationState());
  }

  Future<void> logout(IsLogoutEvent event, Emitter<AuthenticationState> emit) async {
    emit(LogoutProccesState());
    final String? dataSession = await SharedPrefUtils().getSession();
    SessionToken sessionToken;

    if(dataSession != null){
      sessionToken = SessionToken.fromJson(json.decode(dataSession));
      try{
        LogoutResponse logoutResponse = await AuthenticationApi().logoutService(sessionToken.accesToken);

        if(logoutResponse.statusResponse != null)  {
          if(logoutResponse.statusResponse!.code == 200) {
            emit(LogoutSuccessState());
          } else {
            emit(LogoutFailureState(logoutResponse.statusResponse!.message));
          }
        } else {
          emit(const LogoutFailureState("can't get data from server"));
        }
      } catch (error) {
        emit(LogoutFailureState(error.toString()));
      }
    } else {
      emit(const LogoutFailureState("Cant get dataSession"));
    }
  }
}
