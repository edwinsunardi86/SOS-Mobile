import 'package:permission_handler/permission_handler.dart';

class RequestPermission {
  static Future<String?> requestLocationPermission() async {
    //final serviceStatusLocation = await Permission.locationWhenInUse.isGranted;
    //bool isLocation = serviceStatusLocation == ServiceStatus.enabled;
    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      return 'Permission Granted';
    } else if (status == PermissionStatus.denied) {
      await openAppSettings();
      return 'Permission Denied';
    } else if (status == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
      return 'Permission Permanently Denied';
    }
    return 'Permission Restricted';
  }

  static Future<String?> requestCameraPermission() async {
    //final serviceStatusCamera = await Permission.camera.isGranted;
    final status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      return 'Permission Granted';
    } else if (status == PermissionStatus.denied) {
      await openAppSettings();
      return 'Permission Denied';
    } else if (status == PermissionStatus.permanentlyDenied) {
      return 'Permission Permanently Denied';
    }
    return 'Permission Restricted';
  }
}
