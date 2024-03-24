part of 'authentication_bloc.dart';

sealed class AuthenticationState {}

final class AuthenticationUnknownState extends AuthenticationState {}

final class AuthenticationUnAuthenticationState extends AuthenticationState {}

final class AuthenticationAuthenticationState extends AuthenticationState {}

final class AuthenticationIsFirstState extends AuthenticationState {}
