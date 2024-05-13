import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';


class IndexRecommendationCubit extends Cubit<int> {
  IndexRecommendationCubit() : super(0);

  void onChangeIndex(int index){
    emit(index);
  }
}
