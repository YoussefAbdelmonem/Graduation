import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meaw/yousef/data/services/media_services/media_surface_interface.dart';
import 'package:meaw/yousef/screen/dymmy/avatar_uploader.dart';

import '../../data/services/service_locator/service_locator.dart';
import 'avatar.dart';

class AvatarUploader extends StatefulWidget {
  @override
  _AvatarUploaderState createState() => _AvatarUploaderState();
}

class _AvatarUploaderState extends State<AvatarUploader> {
  final MediaServiceInterface _mediaService = getIt<MediaServiceInterface>();

  File? imageFile;
  bool _isLoadingGettingImage = false;

  Future<AppImageSource?> _pickImageSource() async {
    AppImageSource? _appImageSource = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => ImagePickerActionSheet(),
    );
    if (_appImageSource != null) {
      _getImage(_appImageSource);
    }
  }

  Future _getImage(AppImageSource _appImageSource) async {
    setState(() => _isLoadingGettingImage = true);
    final _pickedImageFile = await _mediaService.uploadImage(context, _appImageSource);
    setState(() => _isLoadingGettingImage = false);

    if (_pickedImageFile != null) {
      setState(() => imageFile = _pickedImageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AvatarContainer(
      isLoading: _isLoadingGettingImage,
      onTap: _pickImageSource,
      imageFile: imageFile,
    );
  }
}
