import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/common/edit_profile/data/models/update_profile_model.dart';
import 'package:freelancer/features/common/edit_profile/data/repo/update_profile_repo.dart';
import 'package:freelancer/features/common/profile/data/models/profile_models.dart';

import '../../../../../core/shared/shared_preferences_helper.dart';
import '../../../../auth/data/models/auth_action_response_model.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.updateProfileRepo) : super(EditProfileInitial());

  final UpdateProfileRepo updateProfileRepo;

  static EditProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController languagesController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void updateProfile() async {
    emit(EditProfileLoading());
    final response = await updateProfileRepo.updateProfile(
      UpdateProfileRequestBodyModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        countryCode: countryCodeController.text,
        phone: phoneNumberController.text,
      ),
    );

    response.fold(
      (ifLeft) => emit(EditProfileFailure(ifLeft.displayMessage)),
      (ifRight) => emit(EditProfileSuccess(ifRight)),
    );
  }

  // delete account

  bool obscureText = true;

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    emit(ProfileChangeVisiblePassword()); // or use your existing state
  }

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formDeleteKey = GlobalKey<FormState>();

  void deleteAccount() async {
    emit(ProfileDeleteAccountLoading());
    final response = await updateProfileRepo.deleteAccount(
      DeleteAccountBodyModel(password: passwordController.text),
    );
    response.fold((l) => emit(ProfileDeleteAccountFailure(l.displayMessage)), (
      r,
    ) async {
      await SharedPreferencesHelper.clearAllKeys();

      emit(ProfileDeleteAccountSuccess(r));
    });
  }

  // social media
  TextEditingController socialMediaTypeController = TextEditingController();
  TextEditingController socialMediaLinkController = TextEditingController();
}
