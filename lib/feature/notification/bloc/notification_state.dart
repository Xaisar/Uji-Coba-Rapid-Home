part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();
  
  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

final class NotificationInitialProssesState extends NotificationState {}

final class NotificationInitialSuccesState extends NotificationState {}

final class NotificationInitialFailureState extends NotificationState {}
