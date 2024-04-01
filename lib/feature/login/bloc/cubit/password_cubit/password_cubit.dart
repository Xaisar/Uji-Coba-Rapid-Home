import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordInitial());

  void onChangePassword(String password){
    if(password == ""){
      emit(NullErrorPasswordState());
    } else {
      emit(OnChangePasswordState());
    }
  }
}
