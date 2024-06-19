part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserExpiredTokenState extends UserState {
  final String message = "Your session has expired, please login again";
}

final class InitialUserProccesState extends UserState {}

final class InitialUserSuccesState extends UserState {
  final User user;

  const InitialUserSuccesState(this.user);
}

final class InitialUserFailureState extends UserState {
  final String error;

  const InitialUserFailureState(this.error);
}
