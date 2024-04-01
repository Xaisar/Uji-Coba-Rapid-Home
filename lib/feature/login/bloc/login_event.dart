part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class InitialLoginEvent extends LoginEvent{}

final class OnSubmittedEvent extends LoginEvent{
  final String email;
  final String password;
  final bool rememberAccount;
  
  const OnSubmittedEvent(this.email, this.password, this.rememberAccount);
}

final class OnValidateTokenEvent extends LoginEvent {
  final SessionToken sessionToken;

  const OnValidateTokenEvent(this.sessionToken);
}