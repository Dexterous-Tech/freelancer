import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_speciality_state.dart';

class RequestSpecialityCubit extends Cubit<RequestSpecialityState> {
  RequestSpecialityCubit() : super(RequestSpecialityInitial());

  static RequestSpecialityCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
