part of 'recommendation_home_bloc.dart';

sealed class RecommendationHomeEvent extends Equatable {
  const RecommendationHomeEvent();

  @override
  List<Object> get props => [];
}

final class InitialRecommendationHome extends RecommendationHomeEvent{}

final class RecommendationHomeInitialEvent extends RecommendationHomeEvent {}
