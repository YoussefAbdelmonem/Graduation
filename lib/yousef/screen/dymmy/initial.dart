
import 'package:flutter/material.dart';
import 'package:meaw/yousef/screen/dymmy/image.dart';

class FileUploadServiceHomePage extends StatelessWidget {
  static const String routeName = 'file-upload-service-home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Avatar Uploader'),
      ),
      body: Center(
        child: AvatarUploader(),
      ),
    );
  }
}
