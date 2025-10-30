import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());

  static ContactUsCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
