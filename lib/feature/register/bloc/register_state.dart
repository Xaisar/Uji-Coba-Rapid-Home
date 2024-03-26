part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class OnChangeEmailState extends RegisterState{}

final class NullErrorEmailState extends RegisterState{}

final class OnChangeNameState extends RegisterState{}

final class NullErrorNameState extends RegisterState{}

final class OnChangePasswordState extends RegisterState{}

final class NullErrorPasswordState extends RegisterState{}

final class OnChangeConfirmPasswordState extends RegisterState{}

final class NullErrorConfirmPasswordState extends RegisterState{}

final class OnSubmittedState extends RegisterState{}

final class NullErrorSubmittedState extends RegisterState{}

final class RegisterSuccessState extends RegisterState{}

final class RegisterFailureState extends RegisterState{
  final String error;

  const RegisterFailureState(this.error);
}