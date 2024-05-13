import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';

part 'index_customer_state.dart';

class IndexCustomerCubit extends Cubit<IndexCustomerState> {
  IndexCustomerCubit() : super(IndexCustomerInitial());

  void changeState(int i) async {
    emit(IndexCustomerInitial());
    emit(IndexCustomerChangeState(i));
    await SharedPrefUtils().storedCurentCustomer(i);
    debugPrint(state.toString());
  }
}
