part of 'email_cubit.dart';

sealed class EmailState extends Equatable {
  const EmailState();

  @override
  List<Object> get props => [];
}

final class EmailInitial extends EmailState {}

final class OnChangeEmailState extends EmailState {}

final class NullErrorEmailState extends EmailState {}
