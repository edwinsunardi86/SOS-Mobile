import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                    HexColor('#A4161A'),
                    HexColor('#BA181B'),
                    HexColor('#E5383B'),
                    HexColor('#E5383B'),
                    HexColor('#BA181B'),
                    HexColor('#A4161A'),
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
                                padding: EdgeInsets.all(8.0),
                                child: Image(
                                    width: 200,
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
                    flex: 8,
                    child: Wrap(
                      spacing:
                          20, // to apply margin in the main axis of the wrap
                      runSpacing:
                          20, // to apply margin in the cross axis of the wrap
                      children: const <Widget>[
                        CustomButtonGradient(
                          inputText: "SOS Karir",
                          fontFamily: "Squada One",
                          fontSize: 20,
                        ),
                        CustomButtonGradient(
                          inputText: "Absensi",
                          fontFamily: "Squada One",
                          fontSize: 20,
                        ),
                        CustomButtonGradient(
                          inputText: "OMO",
                          fontFamily: "Squada One",
                          fontSize: 20,
                        ),
                        CustomButtonGradient(
                          inputText: "Operasional",
                          fontFamily: "Squada One",
                          fontSize: 20,
                        ),
                        CustomButtonGradient(
                          inputText: "Worker",
                          fontFamily: "Squada One",
                          fontSize: 20,
                        ),
                        CustomButtonGradient(
                          inputText: "Tambah Karyawan Baru",
                          fontFamily: "Squada One",
                          fontSize: 20,
                        ),
                        CustomButtonGradient(
                          inputText: "Ganti Kode Akses",
                          fontFamily: "Squada One",
                          fontSize: 20,
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
