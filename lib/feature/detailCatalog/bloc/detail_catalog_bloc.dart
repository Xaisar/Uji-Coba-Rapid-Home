import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../authentication/model/session_token_model.dart';
import '../model/detail_catalog_model.dart';
import '../model/get_detail_catalog_response_model.dart';
import '../service/detail_catalog_api.dart';

part 'detail_catalog_event.dart';
part 'detail_catalog_state.dart';

class DetailCatalogBloc extends Bloc<DetailCatalogEvent, DetailCatalogState> {
  DetailCatalogBloc() : super(DetailCatalogInitial()) {
    on<DetailCatalogEvent>((event, emit) {});

    on<DetailCatalogInitialEvent>(initialDetailCatalog);
  }

  Future<void> initialDetailCatalog (DetailCatalogInitialEvent event, Emitter<DetailCatalogState> emit) async {
    emit(DetailCatalogInitialProccesState());

    SessionToken? sessionToken;

    await SharedPrefUtils().getSession().then((sessionTokenValue) async {
      if(sessionTokenValue != null){
        sessionToken = SessionToken.fromJson(json.decode(sessionTokenValue));

        try{
          GetDetailCatalogResponse getDetailCatalogResponse = await DetailCatalogApi().detailCatalogService(sessionToken!.accesToken, event.catalogId);

          if(getDetailCatalogResponse.statusResponse != null) {
            if(getDetailCatalogResponse.statusResponse!.code == 200) {
              String speed = getDetailCatalogResponse.data!.detailCatalog.speed.replaceAll(RegExp(r'\D'), '');

              emit(DetailCatalogInitialSuccesState(getDetailCatalogResponse.data!.detailCatalog, speed));
            } else {
              emit(DetailCatalogInitialFailureState(getDetailCatalogResponse.statusResponse!.message));
            }
          } else {
            emit(const DetailCatalogInitialFailureState("can't get data from server"));
          }
        } catch (error) {
          debugPrint(error.toString());
          emit(DetailCatalogInitialFailureState(error.toString()));
        }
      } else {
        emit(const DetailCatalogInitialFailureState("can't get data from memory"));
      }
    });
  }
}
