import 'dart:async';

import 'package:flutter/material.dart';
import 'package:text_style/component/custom_button.dart';
import 'package:text_style/component/custom_dialog_box.dart';

class ResendEmailVerification extends StatefulWidget {
  const ResendEmailVerification({Key? key}) : super(key: key);

  @override
  State<ResendEmailVerification> createState() =>
      _ResendEmailVerificationState();
}

class _ResendEmailVerificationState extends State<ResendEmailVerification> {
  bool onPressed = true;
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
                            CustomButtonGradientIconClass(
                              onPressed: () async {
                                setState(() {});
                                // Future.delayed(const Duration(seconds: 5), () {
                                showDialog(
                                    context: context,
                                    useSafeArea: true,
                                    builder: (_) {
                                      return const CustomDialogBox(
                                          title: "Test",
                                          description: "deskripsi",
                                          text: "test");
                                    });
                                // });
                              },
                              inputText: "Resend Email",
                              iconClass: Icons.send_outlined,
                            )
                          ])))
                ]))));
  }

  // Timer scheduleTimeout([int milliseconds = 10000]) =>
  //     Timer(Duration(milliseconds: milliseconds), handleTimeOut);
  // void handleTimeOut() {
  //   setState(() {
  //     onPressed = false;
  //   });
  // }
}
