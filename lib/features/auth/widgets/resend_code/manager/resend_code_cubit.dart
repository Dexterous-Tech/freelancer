import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/auth/widgets/resend_code/data/repo/resend_code_repo.dart';

import '../../../data/models/auth_action_response_model.dart';
import '../../../login/data/models/forget_password_model.dart';

part 'resend_code_state.dart';

class ResendCodeCubit extends Cubit<ResendCodeState> {
  ResendCodeCubit(this._resendCodeRepo) : super(ResendCodeInitial());

  static ResendCodeCubit get(context) => BlocProvider.of(context);

  final ResendCodeRepo _resendCodeRepo;
  Timer? _timer;
  int remainingSeconds = 0;

  void startTimer() {
    remainingSeconds = 60;
    emit(ResendCodeTimerUpdated());

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        emit(ResendCodeTimerUpdated());
      } else {
        timer.cancel();
        emit(ResendCodeTimerFinished());
      }
    });
  }

  void resendCode({required String countryCode, required String phone}) async {
    emit(ResendCodeLoading());
    final response = await _resendCodeRepo.resendOtp(
      ForgetPasswordRequestBodyModel(countryCode: countryCode, phone: phone),
    );

    response.fold(
      (error) {
        emit(ResendCodeFailure(error.displayMessage));
      },
      (success) {
        startTimer();

        emit(ResendCodeSuccess(success));
      },
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
