import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/client/edit_profile/data/models/update_profile_model.dart';
import 'package:freelancer/features/client/edit_profile/data/repo/update_profile_repo.dart';
import 'package:freelancer/features/client/profile/data/models/profile_models.dart';

import '../../../../../core/shared/shared_preferences_helper.dart';
import '../../../../auth/data/models/auth_action_response_model.dart';

part 'client_edit_profile_state.dart';

class ClientEditProfileCubit extends Cubit<ClientEditProfileState> {
  ClientEditProfileCubit(this.updateProfileRepo)
    : super(ClientEditProfileInitial());

  final UpdateProfileRepo updateProfileRepo;

  static ClientEditProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void updateProfile() async {
    emit(ClientEditProfileLoading());
    final response = await updateProfileRepo.updateProfile(
      UpdateProfileRequestBodyModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        countryCode: countryCodeController.text,
        phone: phoneNumberController.text,
      ),
    );

    response.fold(
      (ifLeft) => emit(ClientEditProfileFailure(ifLeft.displayMessage)),
      (ifRight) => emit(ClientEditProfileSuccess(ifRight)),
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
}
