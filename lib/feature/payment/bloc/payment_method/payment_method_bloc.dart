import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../authentication/model/session_token_model.dart';
import '../../model/get_payment_method_response_model.dart';
import '../../model/payment_method_model.dart';
import '../../service/payment_api.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) {});

    on<InitialPaymentMethodEvent>(initialPaymentMethod);
  }

  Future<void> initialPaymentMethod(InitialPaymentMethodEvent event, Emitter<PaymentMethodState> emit) async {
    SessionToken? sessionToken;

    await SharedPrefUtils().getSession().then((sessionTokenValue) async {
      if(sessionTokenValue != null) {
        sessionToken = SessionToken.fromJson(json.decode(sessionTokenValue));

        try{
          GetPaymentMethodResponse getPaymentMethodResponse = await PaymentApi().paymentMethodService(sessionToken!.accesToken, event.billId);

          if(getPaymentMethodResponse.statusResponse != null){
            if(getPaymentMethodResponse.statusResponse!.code == 200){
              emit(PaymentMethodSuccesState(getPaymentMethodResponse.data!.paymentMethods));
            } else {
              emit(PaymentMethodFailureState(getPaymentMethodResponse.statusResponse!.message));
            }
          } else {
            emit(const PaymentMethodFailureState("can't get data from server"));
          }
        } catch (error) {
          debugPrint(error.toString());
          emit(PaymentMethodFailureState(error.toString()));
        }
      } else {
        emit(const PaymentMethodFailureState("can't get data from memory"));
      }
    });
  }
}
