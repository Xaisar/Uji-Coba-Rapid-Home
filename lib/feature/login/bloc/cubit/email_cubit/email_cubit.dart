import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailInitial());

  void onChangeEmail(String email){
    if(email == ""){
      emit(NullErrorEmailState());
    } else {
      emit(OnChangeEmailState());
    }
  }
}
