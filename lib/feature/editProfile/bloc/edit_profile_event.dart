part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

final class EditProfileUserEvent extends EditProfileEvent {
  final String id;
  final XFile? avatar;
  final EditUser editUser;

  const EditProfileUserEvent({
    required this.id, 
    this.avatar, 
    required this.editUser});
}
