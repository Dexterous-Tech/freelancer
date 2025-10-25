import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/auth/verification/data/repo/verification_repo.dart';

import '../../../data/models/auth_action_response_model.dart';
import '../../../data/models/verify_model.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit(this.verificationRepo) : super(VerificationInitial());

  final VerificationRepo verificationRepo;
  static VerificationCubit get(context) => BlocProvider.of(context);

  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  void verifyOtp({
    required String countryCode,
    required String phone,
    bool isUpdateProfile = false,
    String? newPassword,
    String? newCountryCode,
  }) async {
    emit(VerificationLoading());
    final response = isUpdateProfile
        ? await verificationRepo.verifyUpdateProfile(
            VerifyRequestBodModel(
              countryCode: countryCode,
              phone: phone,
              newCountryCode: newCountryCode,
              newPassword: newPassword,
              otpCode: codeController.text,
            ),
          )
        : await verificationRepo.verifyForget(
            VerifyRequestBodModel(
              countryCode: countryCode,
              phone: phone,
              otpCode: codeController.text,
            ),
          );

    response.fold(
      (error) {
        emit(VerificationFailure(error.displayMessage));
      },
      (success) {
        emit(VerificationSuccess(success));
      },
    );
  }
}
