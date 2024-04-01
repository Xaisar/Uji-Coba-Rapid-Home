part of 'password_cubit.dart';

sealed class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

final class PasswordInitial extends PasswordState {}

final class OnChangePasswordState extends PasswordState{}

final class NullErrorPasswordState extends PasswordState{}