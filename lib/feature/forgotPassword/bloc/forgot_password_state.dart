part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
  
  @override
  List<Object> get props => [];
}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ResetPasswordProccesState extends ForgotPasswordState {}

final class ResetPasswordFailureState extends ForgotPasswordState {
  final String error;

  const ResetPasswordFailureState(this.error);
}

final class ResetPasswordSuccesState extends ForgotPasswordState {
  final String message;

  const ResetPasswordSuccesState(this.message);
}
