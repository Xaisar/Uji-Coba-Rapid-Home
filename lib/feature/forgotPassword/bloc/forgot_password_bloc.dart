import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/forgot_password_response_model.dart';
import '../service/forgot_password_api.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) {});

    on<ResetPasswordEvent>(resetPassword);
  }

  Future<void> resetPassword (ResetPasswordEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(ResetPasswordProccesState());

    try{
      ForgotPasswordResponse forgotPasswordResponse = await ForgotPasswordApi().forgotPasswordService(event.email);

      if(forgotPasswordResponse.statusResponse != null) {
        if(forgotPasswordResponse.statusResponse!.code == 200) {
          emit(const ResetPasswordSuccesState("Permintaan reset password berhasil, silahkan cek email anda"));
        } else {
          if(forgotPasswordResponse.errors!.email != null) {
            emit(ResetPasswordFailureState(forgotPasswordResponse.errors!.email!));
          } else {
            emit(ResetPasswordFailureState(forgotPasswordResponse.statusResponse!.message));
          }
        }
      } else {
        emit(const ResetPasswordFailureState("can't get data from server"));
      }
    } catch (error) {
      emit(ResetPasswordFailureState(error.toString()));
    }
  }
}
