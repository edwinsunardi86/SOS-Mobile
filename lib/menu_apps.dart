import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:text_style/custom_background.dart';

void main() {
  runApp(const MenuApps());
}

List<String> images = [
  'assets/images/banner/banner-01.png',
  'assets/images/banner/banner-03.png',
  'assets/images/banner/banner-05.png',
];

class MenuApps extends StatefulWidget {
  const MenuApps({Key? key}) : super(key: key);

  // const MenuApps({Key? key}) : super(key: key);
  @override
  State<MenuApps> createState() => _MenuAppsState();
}

class _MenuAppsState extends State<MenuApps> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: Stack(
          children: [
            //color: Colors.blue,
            const CustomBackground(),

            Column(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                          width: 110,
                          image: AssetImage("assets/images/LOGO-PT-SOS.png")),
                      Text("MOBILE",
                          style: TextStyle(
                              letterSpacing: 6,
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontSize: 17,
                              fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
                Flexible(
                    flex: 6,
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      //color: Colors.yellow,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            CustomButtonGradient(
                              inputText: "Karir",
                              fontFamily: "Roboto",
                              fontSize: 17,
                              iconImage: "assets/images/icons/karir.png",
                              androidPackageName: "psi.recruitment.sos",
                            ),
                            CustomButtonGradient(
                              inputText: "Absensi",
                              fontFamily: "Roboto",
                              fontSize: 17,
                              iconImage: "assets/images/icons/absensi.png",
                              androidPackageName: "",
                            ),
                            CustomButtonGradient(
                              inputText: "OMO",
                              fontFamily: "Roboto",
                              fontSize: 17,
                              iconImage: "assets/images/icons/OMO.png",
                            ),
                            CustomButtonGradient(
                              inputText: "Operasional",
                              fontFamily: "Roboto",
                              fontSize: 17,
                              iconImage: "assets/images/icons/operasional.png",
                              androidPackageName: "tdsolusi.sos.ops",
                            ),
                            CustomButtonGradient(
                              inputText: "Worker",
                              fontFamily: "Roboto",
                              fontSize: 17,
                              iconImage: "assets/images/icons/worker.png",
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
                      ),
                    )),
                Flexible(
                  flex: 2,
                  //color: Colors.red,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 150.0,
                      autoPlayInterval: const Duration(seconds: 10),
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items: images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image(
                            width: MediaQuery.of(context).size.width * 1,
                            fit: BoxFit.fill,
                            image: AssetImage(i),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
