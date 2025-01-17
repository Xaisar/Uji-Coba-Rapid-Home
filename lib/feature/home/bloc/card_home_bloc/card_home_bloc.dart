import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../authentication/model/session_token_model.dart';
import '../../model/catalog_model.dart';
import '../../../billing/model/billing_model.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_billing_card_response_model.dart';
import '../../model/get_catalog_card_response_model.dart';
import '../../service/home_api.dart';

part 'card_home_event.dart';
part 'card_home_state.dart';

class CardHomeBloc extends Bloc<CardHomeEvent, CardHomeState> {
  CardHomeBloc() : super(CardHomeInitial()) {
    on<CardHomeEvent>((event, emit) {});

    on<InitialCardHome>((event, emit) => emit(CardHomeInitial()));

    on<CardHomeInitialEvent>(initalCardHome);
  }

  Future<void> initalCardHome (CardHomeInitialEvent event, Emitter<CardHomeState> emit) async {
    emit(CardHomeInitialProccesState());

    SessionToken? sessionToken;

    await SharedPrefUtils().getSession().then((sessionTokenValue) async {
      if(sessionTokenValue != null){
        sessionToken = SessionToken.fromJson(json.decode(sessionTokenValue));

        try{
          GetCatalogCardResponse getCatalogCardResponse = await HomeApi().catalogCardService(sessionToken!.accesToken, event.customerId);
          GetBillingCardResponse getBillingCardResponse = await HomeApi().billingCardService(sessionToken!.accesToken, event.customerId);

          if (getCatalogCardResponse.statusResponse != null && getBillingCardResponse.statusResponse != null){
            if (getCatalogCardResponse.statusResponse!.code == 200) {
              if (getBillingCardResponse.statusResponse!.code == 200) {

                String speed = getCatalogCardResponse.data!.catalog!.speed.replaceAll(RegExp(r'\D'), '');

                emit(CardHomeInitialSuccesState(
                  getCatalogCardResponse.data!.catalog,
                  getBillingCardResponse.data!.billingModel,
                  speed
                ));
              } else if (getBillingCardResponse.statusResponse!.code == 401) {
                emit(const CardHomeExpiredTokenState("Your session has expired, please login again"));
              } else {
                emit(CardHomeInitialFailureState(getBillingCardResponse.statusResponse!.message));
              }
            } else if (getCatalogCardResponse.statusResponse!.code == 401) {
              emit(const CardHomeExpiredTokenState("Your session has expired, please login again"));
            } else{
              emit(CardHomeInitialFailureState(getCatalogCardResponse.statusResponse!.message));
            }
          } else {
            emit(const CardHomeInitialFailureState("can't get data from server"));
          }
        } catch (error){
          debugPrint(error.toString());
          emit(CardHomeInitialFailureState(error.toString()));
        }
      } else {
        emit(const CardHomeExpiredTokenState("Can't get token from memory, please login again"));
      }
    });
  }
}
