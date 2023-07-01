part of 'image_picker_cubit.dart';

@immutable
abstract class ImagePickerState {}

class ImagePickerInitial extends ImagePickerState {}

class ProfileImageSuccessState extends ImagePickerState {}

class ProfileImageErrorState extends ImagePickerState {}
