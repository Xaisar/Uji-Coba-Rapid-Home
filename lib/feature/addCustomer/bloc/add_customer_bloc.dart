import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../login/model/validate_token_response_model.dart';
import '../model/add_customer_model.dart';
import '../model/add_customer_response_model.dart';
import '../model/get_merchant_response_model.dart';
import '../service/add_customer_api.dart';
import '../../authentication/model/session_token_model.dart';
import '../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/add_customer_merchant_model.dart';

part 'add_customer_event.dart';
part 'add_customer_state.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  AddCustomerBloc() : super(AddCustomerInitial()) {
    on<AddCustomerEvent>((event, emit) {});

    on<InitialAddCustomerEvent>(initialAddCustomer);

    on<OnSubmiteEvent>(onSubmitted);

    on<OnValidateTokenEvent>(onValidate);
  }

  Future<void> initialAddCustomer(InitialAddCustomerEvent event, Emitter<AddCustomerState> emit) async {
    SessionToken? sessionToken;  

    await SharedPrefUtils().getSession().then((value) => {
      if (value != null) {
        sessionToken = SessionToken.fromJson(json.decode(value))   
      } 
    });

    try {
      if(sessionToken == null) {
        emit(const AddMerhantFailureState("Can't get Session Token"));
      } else {
        GetMerchantResponse getMerchantResponse = await AddCustomerApi().initialService(sessionToken!.accesToken);

        if(getMerchantResponse.statusResponse != null){
          if(getMerchantResponse.statusResponse!.code == 200){
            emit(AddMerhantSuccessState(getMerchantResponse.data!.merchants));
          } else {
            emit(AddMerhantFailureState(getMerchantResponse.statusResponse!.message));
          }
        } else {
          emit(const AddMerhantFailureState("can't get data from server"));
        }
      }
    } catch(error){
      emit(AddMerhantFailureState(error.toString()));
    }
  }

  Future<void> onSubmitted(OnSubmiteEvent event, Emitter<AddCustomerState> emit) async {
    emit(OnSubmiteState());

    AddCustomer addCustomerModel = AddCustomer(merchantId: event.merchantId, customerId: event.customerId);
    SessionToken? sessionToken;

    if(addCustomerModel == const AddCustomer()){
      emit(NullErrorSubmittedState());
    } else {
      await SharedPrefUtils().getSession().then((value) => {
        if (value != null) {
          sessionToken = SessionToken.fromJson(json.decode(value))   
        } 
      });
      try{
        if (sessionToken == null){
          emit( const AddCustomerFailureState("Can't get Session Token"));
        } else {
          AddCustomerResponse addCustomerResponse = await AddCustomerApi().addCustomerService(addCustomerModel, sessionToken!.accesToken);

          if(addCustomerResponse.statusResponse != null){
            if(addCustomerResponse.statusResponse!.code == 200){
              emit(AddCustomerSuccesState());
            } else{
              if(addCustomerResponse.errors != null){
                if(addCustomerResponse.errors!.merchantId != null){
                  emit(AddCustomerFailureState(addCustomerResponse.errors!.merchantId!));
                } else {
                  if(addCustomerResponse.errors!.customerId != null){
                    emit(AddCustomerFailureState(addCustomerResponse.errors!.customerId!));
                  }
                }
              } else {
                emit(AddCustomerFailureState(addCustomerResponse.statusResponse!.message));
              }
            }
          } else {
            emit(const AddCustomerFailureState("can't get data from server"));
          }
        }
      } catch (error){
        emit(AddCustomerFailureState(error.toString()));
      }
    }
  }

  Future<void> onValidate(OnValidateTokenEvent event, Emitter<AddCustomerState> emit) async{
    emit(OnValidateTokenState());

    await SharedPrefUtils().getSession().then((value) async {
      if(value != null){
        SessionToken sessionToken = SessionToken.fromJson(json.decode(value));
        
        try{
          ValidateTokenResponse validateTokenResponse = await AddCustomerApi().validateTokenService(sessionToken.accesToken);

          if(validateTokenResponse.statusResponse != null){
            if(validateTokenResponse.statusResponse!.code == 200){
              final String session = json.encode(validateTokenResponse.data!.sessionToken!.toJson());
              final String user = json.encode(validateTokenResponse.data!.user!.toJson());

              SharedPrefUtils().storedSession(session);
              SharedPrefUtils().storedUser(user);

              emit(ValidateTokenSuccesState());
            } else {
              emit(ValidateTokenFailureState(validateTokenResponse.statusResponse!.message));
            }
          } else {
            emit(const ValidateTokenFailureState("can't get data from server"));
          }
        } catch(error){
          emit(ValidateTokenFailureState(error.toString()));
        }
      } else {
        emit(const ValidateTokenFailureState("can't get session token"));
      }
    });
  }
}
