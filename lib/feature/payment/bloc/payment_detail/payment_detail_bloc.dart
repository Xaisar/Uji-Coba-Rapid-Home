import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../authentication/model/session_token_model.dart';
import '../../model/get_payment_detail_response_model.dart';
import '../../model/payment_detail_model.dart';
import '../../service/payment_api.dart';

part 'payment_detail_event.dart';
part 'payment_detail_state.dart';

class PaymentDetailBloc extends Bloc<PaymentDetailEvent, PaymentDetailState> {
  PaymentDetailBloc() : super(PaymentDetailInitial()) {
    on<PaymentDetailEvent>((event, emit) {});

    on<InitialDetailPaymentEvent>(initialDetailPayment);
  }

  Future<void> initialDetailPayment (InitialDetailPaymentEvent event, Emitter<PaymentDetailState> emit) async {
    SessionToken? sessionToken;

    await SharedPrefUtils().getSession().then((sessionTokenValue) async {
      if(sessionTokenValue != null) {
        sessionToken = SessionToken.fromJson(json.decode(sessionTokenValue));

        try{
          GetPaymentDetailResponse getPaymentDetailResponse = await PaymentApi().paymentDetailService(sessionToken!.accesToken, event.billId);

          if(getPaymentDetailResponse.statusResponse != null) {
            if(getPaymentDetailResponse.statusResponse!.code == 200) {
              if(getPaymentDetailResponse.data!.paymentDetail.status == "ACTIVE") {
                emit(PaymentDetailActiveState(getPaymentDetailResponse.data!.paymentDetail));
              } else {
                emit(PaymentDetailPostedState(getPaymentDetailResponse.data!.paymentDetail));
              }
            } else if (getPaymentDetailResponse.statusResponse!.code == 403) {
              emit(PaymentDetailDoneState());
            } else {
              emit(PaymentDetailFailureState(getPaymentDetailResponse.statusResponse!.message));
            }
          } else {
            emit(const PaymentDetailFailureState("can't get data from server"));
          }
        } catch (error) {
          debugPrint(error.toString());
          emit(PaymentDetailFailureState(error.toString()));
        }
      } else {
        emit(const PaymentDetailFailureState("can't get data from memory"));
      }
    });
  }
}
