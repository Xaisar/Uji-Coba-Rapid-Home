import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'confirm_password_state.dart';

class ConfirmPasswordCubit extends Cubit<ConfirmPasswordState> {
  ConfirmPasswordCubit() : super(ConfirmPasswordInitial());

  void onChangeConfirmPassword(String confirmPassword){
    if(confirmPassword == ""){
        emit(NullErrorConfirmPasswordState());
      } else {
        emit(OnChangeConfirmPasswordState());
      }
  }
}
