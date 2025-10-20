import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/widgets/data/models/settings_model.dart';

import '../../data/privacy_policy_repo.dart';

part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit(this.privacyPolicyRepo) : super(PrivacyPolicyInitial());

  static PrivacyPolicyCubit get(context) => BlocProvider.of(context);

  final PrivacyPolicyRepo privacyPolicyRepo;

  void privacyPolicy() async {
    emit(PrivacyPolicyLoading());
    final response = await privacyPolicyRepo.termsCondition();
    response.fold(
      (l) => emit(PrivacyPolicyFailure(l.displayMessage)),
      (r) => emit(PrivacyPolicySuccess(r)),
    );
  }
}
