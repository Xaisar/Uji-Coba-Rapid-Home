part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class StoredAccountExistState extends LoginState {
  final LoginModel loginModel;

  const StoredAccountExistState(this.loginModel);
}

final class StoredAccountNotExistState extends LoginState {}

final class OnSubmittedState extends LoginState{}

final class NullErrorSubmittedState extends LoginState{}

final class LoginSuccessState extends LoginState{
  final SessionToken sessionToken;

  const LoginSuccessState(this.sessionToken);
}

final class LoginFailureState extends LoginState{
  final String error;

  const LoginFailureState(this.error);
}

final class OnValidateTokenState extends LoginState{}

final class ValidateTokenSuccessWithNoCustomerState extends LoginState{}

final class ValidateTokenSuccessWithCustomerState extends LoginState{}

final class ValidateTokenFailureState extends LoginState{
  final String error;

  const ValidateTokenFailureState(this.error);
}
