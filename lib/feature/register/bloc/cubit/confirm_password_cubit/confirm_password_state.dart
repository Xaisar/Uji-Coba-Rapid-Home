part of 'confirm_password_cubit.dart';

sealed class ConfirmPasswordState extends Equatable {
  const ConfirmPasswordState();

  @override
  List<Object> get props => [];
}

final class ConfirmPasswordInitial extends ConfirmPasswordState {}

final class OnChangeConfirmPasswordState extends ConfirmPasswordState{}

final class NullErrorConfirmPasswordState extends ConfirmPasswordState{}
