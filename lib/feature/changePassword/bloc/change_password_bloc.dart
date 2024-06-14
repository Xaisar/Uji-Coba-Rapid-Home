import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../authentication/model/session_token_model.dart';
import '../model/change_password_model.dart';
import '../model/change_password_response_model.dart';
import '../service/change_password_api.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePasswordEvent>((event, emit) {});

    on<ChangePasswordUserEvent>(changePassword);
  }

  Future<void> changePassword(ChangePasswordUserEvent event, Emitter<ChangePasswordState> emit) async {
    emit(ChangePasswordProccesState());

    SessionToken? sessionToken;

    await SharedPrefUtils().getSession().then((tokenValue) async {
      if(tokenValue != null) {
        sessionToken = SessionToken.fromJson(json.decode(tokenValue));

        try{
          ChangePasswordResponse changePasswordResponse = await ChangePasswordApi().changePasswordService(sessionToken!.accesToken, event.id, event.changePassword);

          if(changePasswordResponse.statusResponse != null){
            if(changePasswordResponse.statusResponse!.code == 200){
              emit(ChangePasswordSuccesState());
            } else {
              if(changePasswordResponse.errors != null){
                if(changePasswordResponse.errors!.password != null){
                  emit(ChangePasswordFailureState(changePasswordResponse.errors!.password!));
                } else if(changePasswordResponse.errors!.passswordConfirm != null) {
                  emit(ChangePasswordFailureState(changePasswordResponse.errors!.passswordConfirm!));
                }
              } else {
                emit(ChangePasswordFailureState(changePasswordResponse.statusResponse!.message));
              }
            }
          } else {
            emit(const ChangePasswordFailureState("can't get data from server"));
          }
        } catch(error){
          debugPrint(error.toString());
          emit(ChangePasswordFailureState(error.toString()));
        }
      } else {
        emit(const ChangePasswordFailureState("can't get data from memory"));
      }
    });
  }
}
