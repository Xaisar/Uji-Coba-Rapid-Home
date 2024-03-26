part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> get props => [];
}

final class AuthenticationUnknownState extends AuthenticationState {}

final class AuthenticationUnAuthenticationState extends AuthenticationState {}

final class AuthenticationAuthenticationState extends AuthenticationState {}

final class AuthenticationIsFirstState extends AuthenticationState {}

final class LogoutSuccessState extends AuthenticationState{}

final class LogoutFailureState extends AuthenticationState{
  final String error;

  const LogoutFailureState(this.error);
}
