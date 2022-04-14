import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'custom_button_gradient.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    // HexColor('#E5383B'),
                    // HexColor('#BA181B'),
                    // HexColor('#A4161A'),
                    // HexColor('#BA181B'),
                    // HexColor('#E5383B'),

                    HexColor('#85182a'),
                    HexColor("#a11d33"),
                    HexColor("#a71e34"),
                    HexColor("#a71e34"),
                    HexColor("#a11d33"),
                    HexColor('#85182a'),
                  ])),
            ),
            Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                                child: Image(
                                    width: 165,
                                    image: AssetImage(
                                        "assets/images/LOGO-PT-SOS.png")),
                              ),
                              Text("MOBILE",
                                  style: TextStyle(
                                      letterSpacing: 6,
                                      color: Colors.white,
                                      fontFamily: "Squada One",
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 7,
                    child: Wrap(
                      spacing:
                          10, // to apply margin in the main axis of the wrap
                      runSpacing:
                          10, // to apply margin in the cross axis of the wrap
                      children: const <Widget>[
                        CustomButtonGradient(
                          inputText: "SOS Karir",
                          fontFamily: "Roboto",
                          fontSize: 17,
                        ),
                        CustomButtonGradient(
                          inputText: "Absensi",
                          fontFamily: "Roboto",
                          fontSize: 17,
                        ),
                        CustomButtonGradient(
                          inputText: "OMO",
                          fontFamily: "Roboto",
                          fontSize: 17,
                        ),
                        CustomButtonGradient(
                          inputText: "Operasional",
                          fontFamily: "Roboto",
                          fontSize: 17,
                        ),
                        CustomButtonGradient(
                          inputText: "Worker",
                          fontFamily: "Roboto",
                          fontSize: 17,
                        ),
                        CustomButtonGradient(
                          inputText: "Tambah Karyawan Baru",
                          fontFamily: "Roboto",
                          fontSize: 17,
                        ),
                        CustomButtonGradient(
                          inputText: "Ganti Kode Akses",
                          fontFamily: "Roboto",
                          fontSize: 17,
                        )
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
