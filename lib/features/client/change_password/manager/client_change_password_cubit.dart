import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'client_change_password_state.dart';

class ClientChangePasswordCubit extends Cubit<ClientChangePasswordState> {
  ClientChangePasswordCubit() : super(ClientChangePasswordInitial());

  static ClientChangePasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
