import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/widgets/bottom_sheet/open_bottom_sheet.dart';
import 'package:freelancer/core/widgets/forms/custom_upload_file.dart';
import 'package:freelancer/features/client/join_us/presentation/manager/join_us_cubit.dart';
import 'package:freelancer/features/client/join_us/presentation/view/widgets/bottom_sheet/select_photo_option.dart';

class JoinUsFirstFormUploadPhoto extends StatelessWidget {
  const JoinUsFirstFormUploadPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JoinUsCubit, JoinUsState>(
      buildWhen: (context, state) =>
          state is JoinMyImageSelected || state is JoinMyImageFailure,
      listenWhen: (context, state) =>
          state is JoinMyImageSelected || state is JoinMyImageFailure,
      builder: (BuildContext context, state) {
        String fileName = '';

        if (state is JoinMyImageSelected) {
          // Extract just the file name, not the full path
          fileName = state.image.path.split('/').last;
        }
        log("file name : $fileName");
        return GestureDetector(
          onTap: () {
            openBottomSheet(
              context: context,
              bottomSheetContent: SelectPhotoOption(),
            );
          },
          child: CustomUploadFile(
            isUpload: state is JoinMyImageSelected,
            fileName: fileName,
          ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}
