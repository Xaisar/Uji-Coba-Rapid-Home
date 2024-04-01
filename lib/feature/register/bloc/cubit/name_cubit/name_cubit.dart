import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'name_state.dart';

class NameCubit extends Cubit<NameState> {
  NameCubit() : super(NameInitial());

  void onChangeName(String name){
    if(name == ""){
      emit(NullErrorNameState());
    } else {
      emit(OnChangeNameState());
    }
  }
}
