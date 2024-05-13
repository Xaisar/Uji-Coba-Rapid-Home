import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';


class IndexHomeCubit extends Cubit<int> {
  IndexHomeCubit() : super(0);

  void onChangeIndex(int index){
    emit(index);
  }
}
