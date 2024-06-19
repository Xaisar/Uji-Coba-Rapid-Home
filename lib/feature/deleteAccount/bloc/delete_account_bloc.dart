import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc() : super(DeleteAccountInitial()) {
    on<DeleteAccountEvent>((event, emit) {});
  }
}
