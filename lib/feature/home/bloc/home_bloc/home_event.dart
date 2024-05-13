part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitialHomeEvent extends HomeEvent {}

class OnRefreshHomeEvent extends HomeEvent {}


