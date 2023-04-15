
import 'package:get_it/get_it.dart';
import 'package:meaw/yousef/data/services/media_services/media_service.dart';

import '../media_services/media_surface_interface.dart';
import '../permission/permission_handler.dart';
import '../permission/permission_service.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  // Permission service is used in FileUploaderService
  // so it must be located first
  getIt.registerSingleton<PermissionService>(PermissionHandlerPermissionService());

  getIt.registerSingleton<MediaServiceInterface>(MediaService());
}