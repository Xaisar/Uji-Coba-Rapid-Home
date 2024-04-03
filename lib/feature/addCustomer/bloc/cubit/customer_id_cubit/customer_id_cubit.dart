import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'customer_id_state.dart';

class CustomerIdCubit extends Cubit<CustomerIdState> {
  CustomerIdCubit() : super(CustomerIdInitial());

  void onChangeCustomerId(String customerId){
    if(customerId == ""){
      emit(NullErrorCustomerIdState());
    } else {
      emit(OnChangeCustomerIdState());
    }
  }
}
