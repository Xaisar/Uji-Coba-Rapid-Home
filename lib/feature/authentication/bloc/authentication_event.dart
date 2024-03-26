part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class InitialApplicationEvent extends AuthenticationEvent{}

// final class CheckAuthenticationEvent extends 

final class IsFirstTimeDoneEvent extends AuthenticationEvent{}

final class UnAuthenticationEvent extends AuthenticationEvent{}

final class IsAuthenticationEvent extends AuthenticationEvent{}

final class IsLogoutEvent extends AuthenticationEvent{}
