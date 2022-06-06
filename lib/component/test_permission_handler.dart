import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class TestPermission extends StatefulWidget {
  const TestPermission({Key? key}) : super(key: key);

  @override
  State<TestPermission> createState() => _TestPermissionState();
}

Future<void> requestLocationPermission() async {
  final serviceStatusLocation = await Permission.locationWhenInUse.isGranted;
  bool isLocation = serviceStatusLocation == ServiceStatus.enabled;
  final status = await Permission.locationWhenInUse.request();
  final statusLocation = await Permission.locationAlways;
  if (status == PermissionStatus.granted) {
    print('Permission Granted');
  } else if (status == PermissionStatus.denied) {
    print('Permission Denied');
    await openAppSettings();
  } else if (status == PermissionStatus.permanentlyDenied) {
    print('Permission Permanently Denied');
    await openAppSettings();
  }
}

class _TestPermissionState extends State<TestPermission> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: TextButton(
              child: Text('Location'),
              onPressed: requestLocationPermission,
            ),
          ),
        ),
      ),
    );
  }
}
