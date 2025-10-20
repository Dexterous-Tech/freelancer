import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/auth/data/models/auth_action_response_model.dart';
import 'package:freelancer/features/client/change_password/data/models/change_password_model.dart';
import 'package:freelancer/features/client/change_password/data/repo/change_password_repo.dart';

part 'client_change_password_state.dart';

class ClientChangePasswordCubit extends Cubit<ClientChangePasswordState> {
  ClientChangePasswordCubit(this.changePasswordRepo)
    : super(ClientChangePasswordInitial());

  final ChangePasswordRepo changePasswordRepo;
  static ClientChangePasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changePassword() async {
    emit(ClientChangePasswordLoading());
    final response = await changePasswordRepo.changePassword(
      ChangePasswordRequestBodyModel(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
        newConfirmationPassword: confirmPasswordController.text,
      ),
    );

    response.fold(
      (error) => emit(ClientChangePasswordFailure(error.displayMessage)),
      (success) => emit(ClientChangePasswordSuccess(success)),
    );
  }
}
