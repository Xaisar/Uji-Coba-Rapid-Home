import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_billing_event.dart';
part 'detail_billing_state.dart';

class DetailBillingBloc extends Bloc<DetailBillingEvent, DetailBillingState> {
  DetailBillingBloc() : super(DetailBillingInitial()) {
    on<DetailBillingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
