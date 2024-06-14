part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

final class ChangePasswordUserEvent extends ChangePasswordEvent{
  final String id;
  final ChangePassword changePassword;

  const ChangePasswordUserEvent(this.id, this.changePassword);
}
