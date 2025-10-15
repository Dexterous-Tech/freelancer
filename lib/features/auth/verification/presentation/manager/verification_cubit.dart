import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());

  static VerificationCubit get(context) => BlocProvider.of(context);

  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Timer? _timer;
  int remainingSeconds = 0;

  void startTimer() {
    remainingSeconds = 60;
    emit(VerificationTimerUpdated());

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        emit(VerificationTimerUpdated());
      } else {
        timer.cancel();
        emit(VerificationTimerFinished());
      }
    });
  }

  void resendCode() {
    // your resend logic here
    startTimer();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
