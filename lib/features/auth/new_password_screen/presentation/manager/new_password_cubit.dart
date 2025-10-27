import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/new_password_model.dart';
import '../../data/repo/new_password_repo.dart';

import '../../../data/models/auth_action_response_model.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit(this.newPasswordRepo) : super(NewPasswordInitial());

  final NewPasswordRepo newPasswordRepo;
  static NewPasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void resetPassword({
    required String countryCode,
    required String phone,
  }) async {
    emit(NewPasswordLoading());
    final response = await newPasswordRepo.resetPassword(
      NewPasswordRequestBodyModel(
        countryCode: countryCode,
        phone: phone,
        newPassword: newPasswordController.text,
        newPasswordConfirmation: confirmNewPasswordController.text,
      ),
    );
    response.fold(
      (failure) => emit(NewPasswordFailure(failure.displayMessage)),
      (success) => emit(NewPasswordSuccess(success)),
    );
  }
}
