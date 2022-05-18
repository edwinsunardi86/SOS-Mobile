import 'dart:async';
import 'dart:convert';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_style/API/api_menu_login.dart';
import 'package:text_style/component/custom_button.dart';
import 'package:text_style/component/custom_dialog_box.dart';
import 'package:text_style/API/api_user.dart';
import 'package:text_style/menu_apps.dart';
import 'package:cron/cron.dart';

import 'API/api_user.dart';
//import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class ResendEmailVerification extends StatefulWidget {
  const ResendEmailVerification({Key? key}) : super(key: key);

  @override
  State<ResendEmailVerification> createState() =>
      _ResendEmailVerificationState();
}

class _ResendEmailVerificationState extends State<ResendEmailVerification> {
  ApiLogin? apiLogin;
  ApiUser? apiUser;
  SharedPreferences? logindata;
  Timer? timer;
  String? email;
  bool? emailVerified;

  @override
  void initState() {
    super.initState();
    initial();
    setState(() {});

    timer = Timer.periodic(
        const Duration(seconds: 5), (Timer T) => streamController());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
  }

  Stream<String> streamController() {
    email = logindata?.getString('email') ?? "";
    late final StreamController<String> controller;
    controller = StreamController<String>(
      onListen: () async {
        await Future<void>.delayed(const Duration(seconds: 1), () async {
          await ApiLogin.getFieldUser(email.toString()).then((value) {
            apiLogin = value;
          });
        });
        controller.add(apiLogin!.emailVerifiedAt.toString());
        await Future<void>.delayed(const Duration(seconds: 1));
        // await controller.close();
      },
    );
    return controller.stream;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        repeat: ImageRepeat.repeat,
                        image: AssetImage(
                            "assets/images/background/red_grad.png"))),
                child: Column(children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 50),
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            const Image(
                                width: 110,
                                image: AssetImage(
                                    "assets/images/LOGO-PT-SOS.png")),
                            const Text("MOBILE",
                                style: TextStyle(
                                    letterSpacing: 6,
                                    color: Colors.white,
                                    fontFamily: "Roboto",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800)),
                            StreamBuilder<String>(
                                stream: streamController(),
                                builder: (context, snapshot) {
                                  Widget? iconWidget;
                                  if (snapshot.hasError) {
                                    iconWidget = const Icon(Icons.error_rounded,
                                        color: Colors.white, size: 35);
                                  } else {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                        iconWidget = const Icon(Icons.info,
                                            color: Colors.white, size: 35);
                                        break;
                                      case ConnectionState.waiting:
                                        iconWidget = const Icon(Icons.pending,
                                            color: Colors.white, size: 35);
                                        break;
                                      case ConnectionState.active:
                                        const Icon(Icons.notifications_active,
                                            color: Colors.white, size: 35);

                                        final cron = Cron();
                                        cron.schedule(
                                            Schedule.parse('*/5 * * * * *'),
                                            () async {
                                          await ApiLogin.getFieldUser(logindata
                                                      ?.getString('email')
                                                      .toString() ??
                                                  "")
                                              .then((value) {
                                            apiLogin = value;
                                          });
                                          String? emailVerified =
                                              apiLogin?.emailVerifiedAt ?? "";
                                          if (emailVerified != "") {
                                            await Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return const MenuApps();
                                            }));
                                          }
                                        });
                                        iconWidget = const Icon(
                                            Icons.notifications_active_rounded,
                                            color: Colors.white,
                                            size: 35);
                                        break;
                                      case ConnectionState.done:
                                        iconWidget = const Icon(Icons.done,
                                            color: Colors.white, size: 35);
                                        break;
                                    }
                                  }
                                  return iconWidget;
                                }),
                            CustomButtonGradientIconClass(
                              onPressed: () async {
                                var req = await ApiUser.sendEmailVerification(
                                    apiLogin!.username.toString(),
                                    apiLogin!.email.toString());
                                var getData = json.decode(req.body);
                                var mappingUser = ApiUser.mapUser(getData);
                                if (req.statusCode == 200) {
                                  if (mappingUser.verifiedEmail.toString() ==
                                      "") {
                                    showDialog(
                                        context: context,
                                        useSafeArea: true,
                                        builder: (_) {
                                          return const CustomDialogBox(
                                              title: "Warning",
                                              description:
                                                  "Check your inbox to verification email",
                                              text: "OK");
                                        });
                                  }
                                } else {
                                  showDialog(
                                      context: context,
                                      useSafeArea: true,
                                      builder: (_) {
                                        return const CustomDialogBox(
                                            title: "Warning",
                                            description:
                                                "Your email has been already verification",
                                            text: "OK");
                                      });
                                }
                              },
                              inputText: "Resend Email Verification",
                              iconClass: Icons.send_outlined,
                            )
                          ])))
                ]))));
  }
}
