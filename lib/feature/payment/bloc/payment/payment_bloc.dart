import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../authentication/model/session_token_model.dart';
import '../../model/cancel_payment_response_model.dart';
import '../../model/get_payment_response_model.dart';
import '../../model/payment_model.dart';
import '../../service/payment_api.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentEvent>((event, emit) {});

    on<SendPaymentEvent>(sendPayment);

    on<CancelPaymentEvent>(cancelPayment);
  }

  Future<void> sendPayment (SendPaymentEvent event, Emitter<PaymentState> emit) async {
    emit(PaymentProccesState());
    SessionToken? sessionToken;

    await SharedPrefUtils().getSession().then((sessionTokenValue) async {
      if(sessionTokenValue != null){
        sessionToken = SessionToken.fromJson(json.decode(sessionTokenValue));

        try{
          GetPaymentResponse getPaymentResponse = await PaymentApi().paymentService(sessionToken!.accesToken, event.payment);

          if(getPaymentResponse.statusResponse != null) {
            if(getPaymentResponse.statusResponse!.code == 200) {
              emit(PaymentSuccesState());
            } else {
              emit(PaymentFailureState(getPaymentResponse.statusResponse!.message));
            }
          } else {
            emit(const PaymentFailureState("can't get data from server"));
          }
        } catch (error) {
          debugPrint(error.toString());
          emit(PaymentFailureState(error.toString()));
        }
      } else {
        emit(const PaymentFailureState("can't get data from memory"));
      }
    });
  }

  Future<void> cancelPayment (CancelPaymentEvent event, Emitter<PaymentState> emit) async {
    emit(PaymentProccesState());
    SessionToken? sessionToken;

    await SharedPrefUtils().getSession().then((sessionTokenValue) async {
      if(sessionTokenValue != null) {
        sessionToken = SessionToken.fromJson(json.decode(sessionTokenValue));

        try{
          CancelPaymentResponse cancelPaymentResponse = await PaymentApi().cancelPaymentService(sessionToken!.accesToken, event.billId);

          if(cancelPaymentResponse.statusResponse != null) {
            if(cancelPaymentResponse.statusResponse!.code == 200) {
              emit(PaymentInitial());
            } else {
              if(cancelPaymentResponse.errors != null) {
                if(cancelPaymentResponse.errors!.billId != null) {
                  emit(CancelPaymentFailureState(cancelPaymentResponse.errors!.billId!));
                }
              } else {
                emit(CancelPaymentFailureState(cancelPaymentResponse.statusResponse!.message));
              }
            }
          } else {
            emit(const CancelPaymentFailureState("can't get data from server"));
          }
        } catch (error) {
          debugPrint(error.toString());
          emit(CancelPaymentFailureState(error.toString()));
        }
      } else {
        emit(const CancelPaymentFailureState("can't get data from memory"));
      }
    });
  }
}
