import 'package:flutter/material.dart';
import 'package:text_style/component/custom_background.dart';
import 'package:text_style/component/custom_form_login.dart';
import 'package:text_style/component/custom_logo.dart';
import 'package:flutter/services.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          const CustomBackground(),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CustomLogo(),
                ],
              ),
              flex: 2,
            ),
            Flexible(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(children: const [
                    Align(
                      alignment: Alignment.center,
                      child: Text("Login",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: Colors.white,
                              fontSize: 25,
                              shadows: <Shadow>[
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                  offset: Offset(3.0, 2.0),
                                )
                              ])),
                    ),
                  ])),
              flex: 1,
            ),
            const Flexible(child: CustomFormLogin(), flex: 9),
          ])
        ]));
  }
}
