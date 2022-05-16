import 'package:flutter/material.dart';
import 'package:text_style/login.dart';
// import 'package:text_style/menu_apps.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_style/menu_apps.dart';
import 'package:text_style/resend_email_verification.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   SharedPreferences? logindata;
//   bool? login;
//   @override
//   void initState() {
//     // super.initState();
//     initial();
//   }

//   void initial() async {
//     logindata = await SharedPreferences.getInstance();

//     login = logindata!.getBool('login') ?? false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: (login != true) ? const MenuApps() : const LoginApp(),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences? logindata;
  bool? login;
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      login = logindata!.getBool('login') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: (login != true) ? const MenuApps() : const LoginApp());
        home: ResendEmailVerification());
  }
}
