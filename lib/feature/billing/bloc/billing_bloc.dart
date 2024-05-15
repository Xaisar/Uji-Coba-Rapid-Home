import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../authentication/model/session_token_model.dart';
import '../../home/model/user_model.dart';
import '../model/get_billing_response_model.dart';
import '../model/billing_model.dart';
import '../service/billing_api.dart';

part 'billing_event.dart';
part 'billing_state.dart';

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  BillingBloc() : super(BillingInitial()) {
    on<BillingEvent>((event, emit) {});

    on<InitialBillingEvent>(getBilling);

    on<OnRefreshBillingEvent>(refreshBilling);
  }

  Future<void> getBilling(InitialBillingEvent event, Emitter<BillingState> emit) async{
    emit(GetBillingProcessState());

    SessionToken? sessionToken;
    User? user;
    int? indexCustomer;

    await SharedPrefUtils().getSession().then((sessionValue) async {
      await SharedPrefUtils().getUser().then((userValue) async {
        await SharedPrefUtils().getCurrentCustomer().then((indexCustomerValue) async {
          if(sessionValue != null && userValue != null && indexCustomerValue != null){
            sessionToken = SessionToken.fromJson(json.decode(sessionValue));
            user = User.fromJson(json.decode(userValue));
            indexCustomer = indexCustomerValue;

            try{
              GetBillingResponse getBillingResponse = await BillingApi().getBillingService(sessionToken!.accesToken, user!.customers[indexCustomer!].id);

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
      });
    });
  }

  Future<void> refreshBilling (OnRefreshBillingEvent event, Emitter<BillingState> emit) async {
    emit(OnRefreshBillingProccesState());

    SessionToken? sessionToken;
    User? user;
    int? indexCustomer;

    await SharedPrefUtils().getSession().then((sessionValue) async {
      await SharedPrefUtils().getUser().then((userValue) async {
        await SharedPrefUtils().getCurrentCustomer().then((indexCustomerValue) async {
          if(sessionValue != null && userValue != null && indexCustomerValue != null){
            sessionToken = SessionToken.fromJson(json.decode(sessionValue));
            user = User.fromJson(json.decode(userValue));
            indexCustomer = indexCustomerValue;

            try{
              GetBillingResponse getBillingResponse = await BillingApi().getBillingService(sessionToken!.accesToken, user!.customers[indexCustomer!].id);

              if (getBillingResponse.statusResponse != null){
                if (getBillingResponse.statusResponse!.code == 200){
                  debugPrint(getBillingResponse.data!.billings.length.toString());
                  emit(OnRefreshBillingSuccesState(getBillingResponse.data!.billings));
                } else {
                  emit(OnRefreshBillingFailureState(getBillingResponse.statusResponse!.message));
                }
              } else {
                emit(const OnRefreshBillingFailureState("can't get data from server"));
              }
            }catch(error){
              emit(OnRefreshBillingFailureState(error.toString()));
            }
          } else {
            emit(const OnRefreshBillingFailureState("can't get data from memory"));
          }
        });
      });
    });
  }
}
