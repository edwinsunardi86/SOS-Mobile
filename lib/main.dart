import 'package:flutter/material.dart';
import 'package:text_style/info_vacancy.dart';
import 'package:text_style/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_style/menu_apps.dart';
import 'package:text_style/registration.dart';
import 'package:text_style/list_business_card.dart';
import 'package:text_style/registration_apply.dart';

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
      login = logindata?.getBool('login') ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: (login != true) ? const MenuApps() : const LoginApp(),
        home: const RegistrationApply(),
        initialRoute: '/',
        routes: {
          '/login': (context) => const LoginApp(),
          '/menu_apps': (context) => const MenuApps(),
          '/register_user': (context) => const Registration(),
          '/info_vacancy': (context) => const InfoVacancy(),
          '/registration_lamar': (context) => const RegistrationApply()
        });
    //home: ResendEmailVerification());
  }
}
