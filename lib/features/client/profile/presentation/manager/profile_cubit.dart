import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/shared/shared_preferences_helper.dart';
import 'package:freelancer/features/auth/data/models/auth_action_response_model.dart';
import 'package:freelancer/features/client/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  static ProfileCubit get(context) => BlocProvider.of(context);

  void logout() async {
    emit(ProfileLogoutLoading());
    final response = await profileRepo.logout();
    response.fold((l) => emit(ProfileLogoutFailure(l.displayMessage)), (
      r,
    ) async {
      await SharedPreferencesHelper.clearAllKeys();
      emit(ProfileLogoutSuccess(r));
    });
  }
}
