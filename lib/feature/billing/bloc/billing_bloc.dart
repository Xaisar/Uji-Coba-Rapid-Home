import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../authentication/model/session_token_model.dart';
import '../../homeIndex/model/customer_model.dart';
import '../model/get_billing_response_model.dart';
import '../model/billing_model.dart';
import '../service/billing_api.dart';

part 'billing_event.dart';
part 'billing_state.dart';

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  BillingBloc() : super(BillingInitial()) {
    on<BillingEvent>((event, emit) {});

    on<InitialBilling>((event, emit) => BillingInitial());

    on<InitialBillingEvent>(getBilling);
  }

  Future<void> getBilling(InitialBillingEvent event, Emitter<BillingState> emit) async{
    emit(GetBillingProcessState());

    SessionToken? sessionToken;

    await SharedPrefUtils().getSession().then((sessionValue) async {
      if(sessionValue != null){
        sessionToken = SessionToken.fromJson(json.decode(sessionValue));

        try{
          GetBillingResponse getBillingResponse = await BillingApi().getBillingService(sessionToken!.accesToken, event.customer.id);

          if (getBillingResponse.statusResponse != null){
            if (getBillingResponse.statusResponse!.code == 200){
              debugPrint(getBillingResponse.data!.billings.length.toString());
              emit(GetBillingSuccesState(getBillingResponse.data!.billings));
            } else {
              emit(GetBillingFailureState(getBillingResponse.statusResponse!.message));
            }
          } else {
            emit(const GetBillingFailureState("can't get data from server"));
          }
        }catch(error){
          emit(GetBillingFailureState(error.toString()));
        }
      } else {
        emit(const GetBillingFailureState("can't get data from memory"));
      }
    });
  }
}
