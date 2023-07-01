import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial());

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(ProfileImageSuccessState());
    } else {
      print('No image selected.');
      emit(ProfileImageErrorState());
    }
  }

  void updateProfileImage ()
  {
    firebase_storage.FirebaseStorage.
    instance.
    ref().
    child("user/${Uri.file(profileImage!.path).pathSegments.last}").
    putFile(profileImage!).
    then((p0)
    {
      p0.ref.getDownloadURL().then((p0){}).
      catchError((error)
      {
        print(error);
      });


    }).
    catchError((e) {});
  }
}
