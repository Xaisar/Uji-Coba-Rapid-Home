part of 'name_cubit.dart';

sealed class NameState extends Equatable {
  const NameState();

  @override
  List<Object> get props => [];
}

final class NameInitial extends NameState {}

final class OnChangeNameState extends NameState{}

final class NullErrorNameState extends NameState{}
