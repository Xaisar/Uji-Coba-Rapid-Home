part of 'recommendation_home_bloc.dart';

sealed class RecommendationHomeState extends Equatable {
  const RecommendationHomeState();
  
  @override
  List<Object> get props => [];
}

final class RecommendationHomeInitial extends RecommendationHomeState {}

final class RecommendationHomeInitialProccesState extends RecommendationHomeState {}

final class RecommendationHomeInitialSuccesstate extends RecommendationHomeState {}

final class RecommendationHomeInitialFailureState extends RecommendationHomeState {}