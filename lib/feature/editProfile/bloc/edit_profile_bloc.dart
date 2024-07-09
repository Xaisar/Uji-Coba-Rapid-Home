import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../authentication/model/session_token_model.dart';
import '../model/edit_profile_response_model.dart';
import '../model/edit_user_model.dart';
import '../service/edit_profile_api.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial()) {
    on<EditProfileEvent>((event, emit) {});

    on<EditProfileUserEvent>(editProfileUser);
  }

  Future<void> editProfileUser(EditProfileUserEvent event, Emitter<EditProfileState> emit) async {
    emit(EditProfielUserProccesState());

    SessionToken? sessionToken;

    await SharedPrefUtils().getSession().then((tokenValue) async {
      if(tokenValue != null) {
        sessionToken = SessionToken.fromJson(json.decode(tokenValue));

        try{
          EditProfileResponse editProfileResponse = await EditProfileApi().editProfileService(
            sessionToken!.accesToken, event.id, event.editUser, event.avatar
          );

          if(editProfileResponse.statusResponse != null){
            if(editProfileResponse.statusResponse!.code == 200){
              emit(EditProfielUserSuccesState());
            } else if (editProfileResponse.statusResponse!.code == 401) {
              emit(const EditProfileExpiredTokenState("Your session has expired, please login again"));
            } else {
              if(editProfileResponse.errors != null){
                if (editProfileResponse.errors!.name != null) {
                  emit(EditProfileUserFailureState(editProfileResponse.errors!.name!));
                } else if (editProfileResponse.errors!.email != null) {
                  emit(EditProfileUserFailureState(editProfileResponse.errors!.email!));
                } else if (editProfileResponse.errors!.avatar != null) {
                  emit(EditProfileUserFailureState(editProfileResponse.errors!.avatar!));
                }
              } else {
                emit(EditProfileUserFailureState(editProfileResponse.statusResponse!.message));
              }
            }
          } else {
            emit(const EditProfileUserFailureState("can't get data from server"));
          }
        } catch (error){
          debugPrint(error.toString());
          emit(EditProfileUserFailureState(error.toString()));
        }
      } else{
        emit(const EditProfileExpiredTokenState("Can't get token from memory, please login again"));
      }
    });
  }
}
