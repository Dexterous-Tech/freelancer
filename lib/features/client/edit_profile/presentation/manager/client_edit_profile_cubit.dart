import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'client_edit_profile_state.dart';

class ClientEditProfileCubit extends Cubit<ClientEditProfileState> {
  ClientEditProfileCubit() : super(ClientEditProfileInitial());

  static ClientEditProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
