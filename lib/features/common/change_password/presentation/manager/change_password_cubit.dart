import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/auth/data/models/auth_action_response_model.dart';

import '../../data/models/change_password_model.dart';
import '../../data/repo/change_password_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.changePasswordRepo) : super(ChangePasswordInitial());

  final ChangePasswordRepo changePasswordRepo;
  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changePassword() async {
    emit(ChangePasswordLoading());
    final response = await changePasswordRepo.changePassword(
      ChangePasswordRequestBodyModel(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
        newConfirmationPassword: confirmPasswordController.text,
      ),
    );

    response.fold(
      (error) => emit(ChangePasswordFailure(error.displayMessage)),
      (success) => emit(ChangePasswordSuccess(success)),
    );
  }
}
