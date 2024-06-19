part of 'edit_profile_bloc.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();
  
  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileExpiredTokenState extends EditProfileState {
  final String message = "Your session has expired, please login again";
}

final class EditProfielUserProccesState extends EditProfileState {}

final class EditProfielUserSuccesState extends EditProfileState {}

final class EditProfileUserFailureState extends EditProfileState {
  final String error;

  const EditProfileUserFailureState(this.error);
}
