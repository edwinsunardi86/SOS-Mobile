import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

List<String> images = [
  'assets/images/banner/banner-01.png',
  'assets/images/banner/banner-03.png',
  'assets/images/banner/banner-05.png',
];

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);
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
            Container(
              margin: const EdgeInsets.all(15),
              child: Column(children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Column(
                          children: const [
                            Image(
                                width: 110,
                                image: AssetImage(
                                    "assets/images/LOGO-PT-SOS.png")),
                            Text("MOBILE",
                                style: TextStyle(
                                    letterSpacing: 6,
                                    color: Colors.white,
                                    fontFamily: "Squada One",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 6,
                    child: Center(
                        child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          CustomButtonGradient(
                            inputText: "Karir",
                            fontFamily: "Roboto",
                            fontSize: 17,
                            icon: "assets/images/icons/karir.png",
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
                            icon: "assets/images/icons/OMO.png",
                          ),
                          CustomButtonGradient(
                            inputText: "Operasional",
                            fontFamily: "Roboto",
                            fontSize: 17,
                            icon: "assets/images/icons/operasional.png",
                          ),
                          CustomButtonGradient(
                            inputText: "Worker",
                            fontFamily: "Roboto",
                            fontSize: 17,
                            icon: "assets/images/icons/worker.png",
                          ),
                          CustomButtonCS(
                            inputText: "Pendaftaran Karyawan Baru",
                            fontFamily: "Roboto",
                            fontSize: 17,
                            icon: "",
                          ),
                          CustomButtonCS(
                            inputText: "Ganti Kode Akses",
                            fontFamily: "Roboto",
                            fontSize: 17,
                            icon: "",
                          ),
                        ],
                      ),
                    ))),
                Flexible(
                  flex: 2,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlay: true,
                    ),
                    items: images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width * 1,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image(
                                fit: BoxFit.fitWidth,
                                image: AssetImage(i),
                              ));
                        },
                      );
                    }).toList(),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
