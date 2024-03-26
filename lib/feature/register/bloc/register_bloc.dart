import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/register_model.dart';
import '../model/register_response_model.dart';
import '../service/register_api.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});
    
    on<OnChangeEmailEvent>((event, emit) {
      if(event.email == ""){
        emit(NullErrorEmailState());
      } else {
        emit(OnChangeEmailState());
      }
    });

    on<OnChangeNameEvent>((event, emit) {
      if(event.name == ""){
        emit(NullErrorNameState());
      } else {
        emit(OnChangeNameState());
      }
    });

    on<OnChangePasswordEvent>((event, emit) {
      if(event.password == ""){
        emit(NullErrorPasswordState());
      } else {
        emit(OnChangePasswordState());
      }
    });

    on<OnChangeConfirmPasswordEvent>((event, emit) {
      if(event.confirmPassword == ""){
        emit(NullErrorConfirmPasswordState());
      } else {
        emit(OnChangeConfirmPasswordState());
      }
    });

    on<OnSubmittedEvent>(onSubmitted);
  }

  Future<void> onSubmitted (OnSubmittedEvent event, Emitter<RegisterState> emit) async {
    emit(OnSubmittedState());

    RegisterModel registerModel = RegisterModel(email: event.email, name: event.name, password: event.password, confirmPassword: event.confirmPassword);

    if(registerModel == const RegisterModel()){
      emit(NullErrorSubmittedState());
    } else {
      try {
        RegisterResponse registerResponse = await RegisterApi().registerService(registerModel);
        
        if(registerResponse.statusResponse != null){
          if(registerResponse.statusResponse!.code == 200){
            emit(RegisterSuccessState());
          } else {
            if(registerResponse.error != null){
              if(registerResponse.error!.name != null){
                emit(RegisterFailureState(registerResponse.error!.name!));
              } else{
                if(registerResponse.error!.email != null){
                  emit(RegisterFailureState(registerResponse.error!.email!));
                } else {
                  if(registerResponse.error!.password != null){
                    emit(RegisterFailureState(registerResponse.error!.password!));
                  } else {
                    if(registerResponse.error!.confirmPassword != null){
                      emit(RegisterFailureState(registerResponse.error!.confirmPassword!));
                    }
                  }
                }
              }
            } else {
              emit(RegisterFailureState(registerResponse.statusResponse!.message));
            }
          }
        } else {
          emit(const RegisterFailureState("can't connect to server"));
        }
      } catch(error){
        emit(RegisterFailureState(error.toString()));
      }
    }
  }
}
