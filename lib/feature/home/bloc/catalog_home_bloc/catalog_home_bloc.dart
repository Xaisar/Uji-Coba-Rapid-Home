import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../authentication/model/session_token_model.dart';
import '../../model/catalog_model.dart';
import '../../model/get_catalogs_response_model.dart';
import '../../service/home_api.dart';

part 'catalog_home_event.dart';
part 'catalog_home_state.dart';

class CatalogHomeBloc extends Bloc<CatalogHomeEvent, CatalogHomeState> {
  CatalogHomeBloc() : super(CatalogHomeInitial()) {
    on<CatalogHomeEvent>((event, emit) {});

    on<InitialCatalogHome>((event, emit) => emit(CatalogHomeInitial()));

    on<CatalogHomeInitialEvent>(initialCatalogHome);
  }

  Future<void> initialCatalogHome (CatalogHomeInitialEvent event, Emitter<CatalogHomeState> emit) async {
    emit(CatalogHomeInitialProccesState());

    SessionToken? sessionToken;

    await SharedPrefUtils().getSession().then((sessionTokenValue) async {
      if (sessionTokenValue != null){
        sessionToken = SessionToken.fromJson(json.decode(sessionTokenValue));

        try{
          GetCatalogsResponse getCatalogsResponse = await HomeApi().catalogsService(sessionToken!.accesToken, event.customerId);

          if(getCatalogsResponse.statusResponse != null) {
            if(getCatalogsResponse.statusResponse!.code == 200) {
              emit(CatalogHomeInitialSuccesstate(getCatalogsResponse.data!.catalogs));
            } else if (getCatalogsResponse.statusResponse!.code == 401) {
              emit(CatalogHomeExpiredTokenState());
            } else {
              emit(CatalogHomeInitialFailureState(getCatalogsResponse.statusResponse!.message));
            }
          } else {
            emit(const CatalogHomeInitialFailureState("can't get data from server"));
          }
        } catch (error) {
          debugPrint(error.toString());
          emit(CatalogHomeInitialFailureState(error.toString()));
        }
      } else {
        emit(const  CatalogHomeInitialFailureState("can't get data from memory"));
      }
    });
  }
}
