import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'folders_state.dart';

class FoldersCubit extends Cubit<FoldersState> {
  FoldersCubit() : super(FoldersInitial());

  static FoldersCubit get(context) => BlocProvider.of(context);

  TextEditingController messageController = TextEditingController();
  File? photo;
}
