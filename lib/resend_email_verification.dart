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

import 'API/api_user.dart';
//import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class ResendEmailVerification extends StatefulWidget {
  const ResendEmailVerification({Key? key}) : super(key: key);

  @override
  State<ResendEmailVerification> createState() =>
      _ResendEmailVerificationState();
}

class _ResendEmailVerificationState extends State<ResendEmailVerification> {
  // CountdownTimerController? controller;
  // int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  //@override
  //void initState() {
  //super.initState();
  //controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  //}

  // void onEnd() {
  //   print('onEnd');
  //   setState(() {
  //     onPressed = true;
  //   });
  // }

  //bool onPressed = false;
  // ApiUser? apiUser;
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
    //setState(() {
    // ApiLogin.getFieldUser(email.toString()).then((value) {
    //   apiLogin = value;
    //   setState(() {});
    // });
    //});
  }

//  final Stream<String> _bids = (() {
//     late final StreamController<String> controller;
//     controller = StreamController<String>(
//       onListen: () async {
//         await Future<void>.delayed(const Duration(seconds: 1));
//         controller.add("test");
//         await Future<void>.delayed(const Duration(seconds: 1));
//         await controller.close();
//       },
//     );
//     return controller.stream;
//   })();
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
                                        iconWidget =
                                            Text(snapshot.data.toString());
                                        break;
                                      case ConnectionState.done:
                                        iconWidget = const Icon(Icons.done,
                                            color: Colors.white, size: 35);
                                        break;
                                    }
                                  }
                                  return iconWidget;
                                  // if (snapshot.hasData) {
                                  //   var getVerified =
                                  //       apiLogin?.emailVerifiedAt ?? "0";
                                  //   if (apiLogin!.emailVerifiedAt != "") {
                                  //     SchedulerBinding.instance!
                                  //         .addPostFrameCallback((_) {
                                  //       Navigator.of(context).pushReplacement(
                                  //           MaterialPageRoute(
                                  //               builder: (context) {
                                  //         return const MenuApps();
                                  //       }));
                                  //     });
                                  //     return Text("Tresss");
                                  //   } else {
                                  //     return Text(getVerified.toString());
                                  //   }

                                  //   // return const ResendEmailVerification();

                                  // } else {
                                  //   return const CircularProgressIndicator(
                                  //       color: Colors.white);
                                  // }
                                }),
                            // CountdownTimer(
                            //     controller: controller,
                            //     onEnd: onEnd,
                            //     endTime: endTime),
                            // (onPressed == true)
                            // ?
                            CustomButtonGradientIconClass(
                              // onPressed: () async {
                              //   setState(() {
                              //     onPressed = false;
                              //     // initState();
                              //   });
                              //   // Future.delayed(const Duration(seconds: 5), () {
                              //   showDialog(
                              //       context: context,
                              //       useSafeArea: true,
                              //       builder: (_) {
                              //         return const CustomDialogBox(
                              //             title: "Test",
                              //             description: "deskripsi",
                              //             text: "test");
                              //       });
                              //   // });
                              // },
                              inputText: "Resend Email",
                              iconClass: Icons.send_outlined,
                            )
                            // : Text("Empty")
                          ])))
                ]))));
  }

  // @override
  // void dispose() {
  //   controller!.dispose();
  //   super.dispose();
  // }
  // Timer scheduleTimeout([int milliseconds = 10000]) =>
  //     Timer(Duration(milliseconds: milliseconds), handleTimeOut);
  // void handleTimeOut() {
  //   setState(() {
  //     onPressed = false;
  //   });
  // }
}
