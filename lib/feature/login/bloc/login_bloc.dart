import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/login_response_model.dart';
import '../../authentication/model/session_token_model.dart';
import '../model/validate_token_response_model.dart';
import '../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/login_model.dart';
import '../service/login_api.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<InitialLoginEvent>(initialLogin);

    on<OnSubmittedEvent>(onSubmitted);

    on<OnValidateTokenEvent>(onValidate);
  }

  Future<void> initialLogin (InitialLoginEvent event, Emitter<LoginState> emit) async {
    final String? account = await SharedPrefUtils().getAccount();
    LoginModel loginModel;
    if(account != null){
      loginModel = LoginModel.fromJson(json.decode(account));
      emit(StoredAccountExistState(loginModel));
    } else{
      emit(StoredAccountNotExistState());
    }
  }

  Future<void> onSubmitted(OnSubmittedEvent event, Emitter<LoginState> emit) async{
    emit(OnSubmittedState());

    LoginModel loginModel = LoginModel(email: event.email, password: event.password);

    if(loginModel == const LoginModel()){
      emit(NullErrorSubmittedState());
    } else {
      try{
        LoginResponse loginResponse = await LoginApi().loginService(loginModel);

        //cek status respon
        if(loginResponse.statusResponse != null){
          // cek respon berhasil
          if(loginResponse.statusResponse!.code == 200){
            //cek apakah ingin menyimpan data
            if(event.rememberAccount == true){
              final String stored = json.encode(loginModel);
              SharedPrefUtils().storedAccount(stored);
	          }
            emit(LoginSuccessState(loginResponse.data!.sessionToken!));
          } else {
            //cek apakah ada pesan error dari server
            if(loginResponse.errors != null){
              if(loginResponse.errors!.email != null){
                emit(LoginFailureState(loginResponse.errors!.email!));
              } else {
                if(loginResponse.errors!.password != null ){
                  emit(LoginFailureState(loginResponse.errors!.password!));
                }
              } 
            } else {
              emit(LoginFailureState(loginResponse.statusResponse!.message));
            }
          }
        } else {
          emit(const LoginFailureState("can't get data from server"));
        }
      } catch(error){
        emit(LoginFailureState(error.toString()));
      }
    }
  }

  Future<void> onValidate(OnValidateTokenEvent event, Emitter<LoginState> emit) async{
    emit(OnValidateTokenState());

    try{
      ValidateTokenResponse validateTokenResponse = await LoginApi().validateTokenService(event.sessionToken.accesToken);

       if(validateTokenResponse.statusResponse != null){
          if(validateTokenResponse.statusResponse!.code == 200){
            final String session = json.encode(validateTokenResponse.data!.sessionToken!.toJson());
            final String user = json.encode(validateTokenResponse.data!.user!.toJson());

            SharedPrefUtils().storedSession(session);
            SharedPrefUtils().storedUser(user);

            if (validateTokenResponse.data!.user!.customers.isEmpty){
              emit(ValidateTokenSuccessWithNoCustomerState());
            } else {
              debugPrint(validateTokenResponse.data!.user!.customers[0].name.toString());
              debugPrint(validateTokenResponse.data!.user!.customers[0].code.toString());
              emit(ValidateTokenSuccessWithCustomerState());
            }
          } else {
            emit(ValidateTokenFailureState(validateTokenResponse.statusResponse!.message));
          }
        } else {
          emit(const ValidateTokenFailureState("can't get data from server"));
        }
    } catch(error){
      emit(ValidateTokenFailureState(error.toString()));
    }
  }
}
