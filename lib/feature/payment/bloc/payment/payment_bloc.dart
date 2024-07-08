import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../authentication/model/session_token_model.dart';
import '../../model/cancel_payment_response_model.dart';
import '../../model/get_payment_detail_response_model.dart';
import '../../model/get_payment_response_model.dart';
import '../../model/payment_model.dart';
import '../../service/payment_api.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentEvent>((event, emit) {});

    on<InitialPaymentEvent>((event, emit) => emit(PaymentInitial()),);

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
              await getPaymentDetailStatus("ACTIVE", sessionToken!.accesToken, event.payment.billId, emit);
            } else if (getPaymentResponse.statusResponse!.code == 401) {
              emit(PaymentProccesDoneState());
              emit(const PaymentExpiredToken("Your session has expired, please login again"));
            } else {
              emit(PaymentProccesDoneState());
              emit(PaymentFailureState(getPaymentResponse.statusResponse!.message));
            }
          } else {
            emit(PaymentProccesDoneState());
            emit(const PaymentFailureState("can't get data from server"));
          }
        } catch (error) {
          debugPrint(error.toString());
          emit(PaymentProccesDoneState());
          emit(PaymentFailureState(error.toString()));
        }
      } else {
        emit(PaymentProccesDoneState());
        emit(const PaymentExpiredToken("Can't get token from memory, please login again"));
      }
    });
  }

  Future<void> cancelPayment (CancelPaymentEvent event, Emitter<PaymentState> emit) async {
    emit(CancelPaymentProccesState());
    SessionToken? sessionToken;

    await SharedPrefUtils().getSession().then((sessionTokenValue) async {
      if(sessionTokenValue != null) {
        sessionToken = SessionToken.fromJson(json.decode(sessionTokenValue));

        try{
          CancelPaymentResponse cancelPaymentResponse = await PaymentApi().cancelPaymentService(sessionToken!.accesToken, event.billId);

          if(cancelPaymentResponse.statusResponse != null) {
            if(cancelPaymentResponse.statusResponse!.code == 200) {
              await getPaymentDetailStatus('POSTED', sessionToken!.accesToken, event.billId, emit);
            } else if (cancelPaymentResponse.statusResponse!.code == 401) {
              emit(const PaymentExpiredToken("Your session has expired, please login again"));
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
        emit(const PaymentExpiredToken("Can't get token from memory, please login again"));
      }
    });
  }

  Future<void> getPaymentDetailStatus(String status, String token, String billId, Emitter<PaymentState> emit) async {
    try {
      GetPaymentDetailResponse? getPaymentDetailResponse;
      bool success = false;
      do {
        await Future.delayed(const Duration(seconds: 2)).then((value) => debugPrint(DateTime.now().toString()));
        getPaymentDetailResponse = await PaymentApi().paymentDetailService(token, billId);

        if(getPaymentDetailResponse.statusResponse != null) {
          if(getPaymentDetailResponse.statusResponse!.code == 200) {
            success = true;
          } else {
            success = false;
            break;
          }
        } else {
          success = false;
          break;
        }
      } while (getPaymentDetailResponse.data!.paymentDetail.status != status);

      if(status == 'ACTIVE') {
        if(success) {
          emit(PaymentProccesDoneState());
          emit(PaymentSuccesState());
        } else {
          emit(PaymentProccesDoneState());
          emit(const PaymentFailureState("ada kesalahan dalam mengambil data"));
        }
      } else {
        if(success) {
          emit(CancelPaymentSuccesState());
        } else {
          emit(const CancelPaymentFailureState("ada kesalahan dalam mengambil data"));
        }
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
