import 'package:flutter/material.dart';
import 'package:text_style/API/api_banner_ads.dart';

import 'component/custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:text_style/component/custom_background.dart';
import 'API/api_menu_apps.dart';

void main() {
  runApp(const MenuApps());
}

class MenuApps extends StatefulWidget {
  const MenuApps({Key? key}) : super(key: key);

  // const MenuApps({Key? key}) : super(key: key);
  @override
  State<MenuApps> createState() => _MenuAppsState();
}

class _MenuAppsState extends State<MenuApps> {
  @override
  void initState() {
    super.initState();
  }

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
                  child: FutureBuilder(
                    future: ApiMenuApps.fetchMenuApps(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ApiMenuApps>> snapshot) {
                      if (snapshot.hasData) {
                        List<ApiMenuApps>? menuApps = snapshot.data;
                        return ListView(
                          children: menuApps!
                              .map((ApiMenuApps menuApp) => Column(
                                    children: [
                                      CustomButtonGradient(
                                        inputText: menuApp.menuAppsName,
                                        fontFamily: "Roboto",
                                        fontSize: 17,
                                        iconImage: menuApp.logoIcon,
                                        androidPackageName:
                                            menuApp.androidAppId,
                                      )
                                    ],
                                  ))
                              .toList(),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  flex: 6,
                ),
                Flexible(
                    child: FutureBuilder(
                      future: ApiBannerAds.fetchBannerAds(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<ApiBannerAds>> snapshot) {
                        if (snapshot.hasData) {
                          List<ApiBannerAds>? apiMenudAds = snapshot.data;
                          return ListView(
                            children: apiMenudAds!
                                .map((ApiBannerAds menuAds) => Column(
                                      children: [
                                        CarouselSlider(
                                          items: apiMenudAds.map((i) {
                                            return Builder(
                                              builder: (BuildContext context) {
                                                return Image(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      1,
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      "http://192.168.3.13:8000/storage/images/banner_ads/" +
                                                          i.uploadImage),
                                                );
                                              },
                                            );
                                          }).toList(),
                                          options: CarouselOptions(
                                            height: 150.0,
                                            autoPlayInterval:
                                                const Duration(seconds: 10),
                                            autoPlay: true,
                                            enlargeCenterPage: true,
                                          ),
                                        )
                                      ],
                                    ))
                                .toList(),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                    flex: 2)
                // Flexible(
                //   flex: 2,
                //   //color: Colors.red,
                //   child: CarouselSlider(
                //     options: CarouselOptions(
                //       height: 150.0,
                //       autoPlayInterval: const Duration(seconds: 10),
                //       autoPlay: true,
                //       enlargeCenterPage: true,
                //     ),
                //     items: images.map((i) {
                //       return Builder(
                //         builder: (BuildContext context) {
                //           return Image(
                //             width: MediaQuery.of(context).size.width * 1,
                //             fit: BoxFit.fill,
                //             image: AssetImage(i),
                //           );
                //         },
                //       );
                //     }).toList(),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
