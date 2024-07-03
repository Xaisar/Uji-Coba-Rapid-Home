part of 'change_password_bloc.dart';

sealed class ChangePasswordState extends Equatable {
  const ChangePasswordState();
  
  @override
  List<Object> get props => [];
}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordExpiredTokenState extends ChangePasswordState {
  final String message;

  const ChangePasswordExpiredTokenState(this.message);
}

final class ChangePasswordProccesState extends ChangePasswordState {}

final class ChangePasswordFailureState extends ChangePasswordState {
  final String error;

  const ChangePasswordFailureState(this.error);
}

final class ChangePasswordSuccesState extends ChangePasswordState {}
