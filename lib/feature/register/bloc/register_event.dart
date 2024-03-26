part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class OnChangeEmailEvent extends RegisterEvent{
  final String email;

  const OnChangeEmailEvent(this.email);
}

final class OnChangeNameEvent extends RegisterEvent{
  final String name;

  const OnChangeNameEvent(this.name);
}

final class OnChangePasswordEvent extends RegisterEvent{
  final String password;

  const OnChangePasswordEvent(this.password);
}

final class OnChangeConfirmPasswordEvent extends RegisterEvent{
  final String confirmPassword;

  const OnChangeConfirmPasswordEvent(this.confirmPassword);
}

final class OnSubmittedEvent extends RegisterEvent{
  final String email;
  final String name;
  final String password;
  final String confirmPassword;

  const OnSubmittedEvent(this.email, this.name, this.password, this.confirmPassword);
}
