part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

final class ResetPasswordEvent extends ForgotPasswordEvent {
  final String email;

  const ResetPasswordEvent(this.email);
}
