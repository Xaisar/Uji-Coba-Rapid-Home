import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../authentication/model/session_token_model.dart';
import '../model/detail_billing_model.dart';
import '../model/get_detail_billing_response_model.dart';
import '../service/detail_billing_api.dart';

part 'detail_billing_event.dart';
part 'detail_billing_state.dart';

class DetailBillingBloc extends Bloc<DetailBillingEvent, DetailBillingState> {
  DetailBillingBloc() : super(DetailBillingInitial()) {
    on<DetailBillingEvent>((event, emit) {});

    on<DetailBillingInitialEvent>(initialDetailBilling);
  }

  Future<void> initialDetailBilling (DetailBillingInitialEvent event, Emitter<DetailBillingState> emit) async{
    emit(DetailBillingInitialProccesState());

    SessionToken? sessionToken;

    await SharedPrefUtils().getSession().then((sessionTokenValue) async {
      if(sessionTokenValue != null){
        sessionToken = SessionToken.fromJson(json.decode(sessionTokenValue));

        try{
          GetDetailBillingResponse getDetailBillingResponse = await DetailBillingApi().detailBillingService(sessionToken!.accesToken, event.billingId);

          if(getDetailBillingResponse.statusResponse != null){
            if(getDetailBillingResponse.statusResponse!.code == 200){
              emit(DetailBillingInitialSuccesState(getDetailBillingResponse.data!.detailBilling));
            } else {
              emit(DetailBillingInitialFailureState(getDetailBillingResponse.statusResponse!.message));
            }
          } else{
            emit(const DetailBillingInitialFailureState("can't get data from server"));
          }
        } catch (error) {
          debugPrint(error.toString());
          emit(DetailBillingInitialFailureState(error.toString()));
        }
      } else {
        emit(const DetailBillingInitialFailureState("can't get data from memory"));
      }
    });
  }
}
