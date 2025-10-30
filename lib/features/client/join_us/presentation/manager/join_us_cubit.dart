import 'dart:developer';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/generated/locale_keys.g.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:device_info_plus/device_info_plus.dart';
part 'join_us_state.dart';

class JoinUsCubit extends Cubit<JoinUsState> {
  JoinUsCubit() : super(JoinUsInitial());

  static JoinUsCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> firstFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> secondFormKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController countryCodeNameController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController genderNameController = TextEditingController();
  TextEditingController professionalServiceController = TextEditingController();
  TextEditingController professionalController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController languagesController = TextEditingController();
  TextEditingController writtenController = TextEditingController();
  File? image;
  File? selectedFile;
  final ImagePicker _picker = ImagePicker();

  // Permission handling methods
  Future<bool> _checkCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      final result = await Permission.camera.request();
      return result.isGranted;
    } else if (status.isPermanentlyDenied) {
      // Show dialog to open app settings
      return false;
    }
    return false;
  }

  Future<bool> _checkStoragePermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        // Android 13+ uses granular media permissions
        final photos = await Permission.photos.status;
        if (photos.isGranted) return true;
        if (photos.isDenied) {
          final result = await Permission.photos.request();
          return result.isGranted;
        }
        return false;
      } else {
        // Android 12 and below
        final storage = await Permission.storage.status;
        if (storage.isGranted) return true;
        if (storage.isDenied) {
          final result = await Permission.storage.request();
          return result.isGranted;
        }
        return false;
      }
    } else {
      // iOS
      final photos = await Permission.photos.status;
      if (photos.isGranted) return true;
      if (photos.isDenied) {
        final result = await Permission.photos.request();
        return result.isGranted;
      }
      return false;
    }
  }

  // upload image
  void pickImageFromCamera() async {
    try {
      // Check camera permission first
      final hasPermission = await _checkCameraPermission();
      if (!hasPermission) {
        emit(
          JoinMyImageFailure(LocaleKeys.authentication_permessionCamera.tr()),
        );
        return;
      }

      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        image = File(pickedFile.path);
        emit(JoinMyImageSelected(image!));
      }
    } catch (e) {
      log('Camera pick error: $e');
      if (e.toString().contains('permission')) {
        emit(
          JoinMyImageFailure(LocaleKeys.authentication_permessionCamera.tr()),
        );
      } else if (e.toString().contains('camera')) {
        emit(JoinMyImageFailure(LocaleKeys.authentication_errorInCamera.tr()));
      } else {
        emit(
          JoinMyImageFailure(
            '${LocaleKeys.authentication_errorTakePhoto.tr()} ${e.toString()}',
          ),
        );
      }
    }
  }

  void pickImageFromGallery() async {
    try {
      // Check storage permission first
      final hasPermission = await _checkStoragePermission();
      if (!hasPermission) {
        emit(
          JoinMyImageFailure(LocaleKeys.authentication_galleryPermession.tr()),
        );
        return;
      }

      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        image = File(pickedFile.path);
        emit(JoinMyImageSelected(image!));
      }
    } catch (e) {
      log('Gallery pick error: $e');
      if (e.toString().contains('permission')) {
        emit(
          JoinMyImageFailure(LocaleKeys.authentication_galleryPermession.tr()),
        );
      } else {
        emit(
          JoinMyImageFailure(
            '${LocaleKeys.authentication_errorGallery.tr()}${e.toString()}',
          ),
        );
      }
    }
  }

  // File picker method for document uploads
  void pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        selectedFile = File(result.files.single.path!);
        emit(JoinMyImageSelected(selectedFile!));
      }
    } catch (e) {
      log('File pick error: $e');
      emit(JoinMyImageFailure('Error picking file: ${e.toString()}'));
    }
  }
}
