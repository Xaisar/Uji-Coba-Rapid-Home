part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class OnSubmittedState extends RegisterState{}

final class NullErrorSubmittedState extends RegisterState{}

final class RegisterSuccessState extends RegisterState{}

final class RegisterFailureState extends RegisterState{
  final String error;

  const RegisterFailureState(this.error);
}