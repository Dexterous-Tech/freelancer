import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/auth/signup/data/models/signup_models.dart';
import 'package:freelancer/features/auth/signup/data/repo/signup_repo.dart';

import '../../../data/models/auth_action_response_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(SignupInitial());

  final SignupRepo signupRepo;
  static SignupCubit get(context) => BlocProvider.of(context);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  void register() async {
    emit(SignupLoading());
    final response = await signupRepo.register(
      SignupRequestBodyModel(
        firstName: firstNameController.text,
        lastName: secondNameController.text,
        countryCode: countryCodeController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      ),
    );
    response.fold(
      (error) {
        emit(SignupFailure(error.displayMessage));
      },
      (success) {
        emit(SignupSuccess(success));
      },
    );
  }
}
