part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class InitialHomeProccesState extends HomeState {} 

final class InitialHomeSuccesState extends HomeState {
  final User user;
  final int indexCustomer;

  const InitialHomeSuccesState(this.user, this.indexCustomer);
} 

final class InitialHomeFailureState extends HomeState {
  final String error;

  const InitialHomeFailureState(this.error);
} 

final class OnRefreshHomeSuccesState extends HomeState {} 

final class OnRefreshHomeFailureState extends HomeState {
  final String error;

  const OnRefreshHomeFailureState(this.error);
} 
