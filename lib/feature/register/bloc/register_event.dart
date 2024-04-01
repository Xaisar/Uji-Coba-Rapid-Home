part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class OnSubmittedEvent extends RegisterEvent{
  final String email;
  final String name;
  final String password;
  final String confirmPassword;

  const OnSubmittedEvent(this.email, this.name, this.password, this.confirmPassword);
}
