import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/auth/data/models/auth_action_response_model.dart';
import 'package:freelancer/features/auth/forget_password/data/models/verify_forget_model.dart';
import 'package:freelancer/features/auth/forget_password/data/repo/verify_forget_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._verifyForgetRepo) : super(ForgetPasswordInitial());

  final VerifyForgetRepo _verifyForgetRepo;
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController otpCodeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  void verifyForget({
    required String countryCode,
    required String phone,
  }) async {
    emit(VerifyForgetLoading());
    final response = await _verifyForgetRepo.verifyForget(
      VerifyForgetRequestBodModel(
        countryCode: countryCode,
        phone: phone,
        otpCode: otpCodeController.text,
      ),
    );

    response.fold(
      (error) {
        emit(VerifyForgetFailure(error.displayMessage));
      },
      (success) {
        emit(VerifyForgetSuccess(success));
      },
    );
  }
}
