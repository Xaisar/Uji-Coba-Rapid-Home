import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recommendation_home_event.dart';
part 'recommendation_home_state.dart';

class RecommendationHomeBloc extends Bloc<RecommendationHomeEvent, RecommendationHomeState> {
  RecommendationHomeBloc() : super(RecommendationHomeInitial()) {
    on<RecommendationHomeEvent>((event, emit) {});

    on<InitialRecommendationHome>((event, emit) => emit(RecommendationHomeInitial()));

    on<RecommendationHomeInitialEvent>(recommendationHomeInitial);
  }

  Future<void> recommendationHomeInitial (RecommendationHomeInitialEvent event, Emitter<RecommendationHomeState> emit) async {}
}
