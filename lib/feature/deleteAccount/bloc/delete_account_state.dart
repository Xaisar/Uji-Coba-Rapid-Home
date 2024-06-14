part of 'delete_account_bloc.dart';

sealed class DeleteAccountState extends Equatable {
  const DeleteAccountState();
  
  @override
  List<Object> get props => [];
}

final class DeleteAccountInitial extends DeleteAccountState {}
