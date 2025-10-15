import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Timer? _timer;
  int remainingSeconds = 0;

  void startTimer() {
    remainingSeconds = 60;
    emit(ForgetPasswordTimerUpdated());

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        emit(ForgetPasswordTimerUpdated());
      } else {
        timer.cancel();
        emit(ForgetPasswordTimerFinished());
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
