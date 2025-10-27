import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/widgets/data/models/settings_model.dart';

import '../../data/about_us_repo.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit(this.aboutUsRepo) : super(AboutUsInitial());

  static AboutUsCubit get(context) => BlocProvider.of(context);

  final AboutUsRepo aboutUsRepo;

  void aboutUs() async {
    emit(AboutUsLoading());
    final response = await aboutUsRepo.aboutUs();
    response.fold(
      (l) => emit(AboutUsFailure(l.displayMessage)),
      (r) => emit(AboutUsSuccess(r)),
    );
  }
}
