import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meaw/yousef/data/services/permission/permission_service.dart';

enum AppImageSource {
  camera,
  gallery,
}

abstract class MediaServiceInterface {
  PermissionService get permissionService;

  Future<File?> uploadImage(
      BuildContext context,
      AppImageSource appImageSource, {
        bool shouldCompress = true,
      });

  Future<File?> compressFile(File file, {int quality = 30});
}