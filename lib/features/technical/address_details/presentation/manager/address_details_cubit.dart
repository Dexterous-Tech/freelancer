import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'address_details_state.dart';

class AddressDetailsCubit extends Cubit<AddressDetailsState> {
  AddressDetailsCubit() : super(AddressDetailsInitial());

  static AddressDetailsCubit get(context) => BlocProvider.of(context);

  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
