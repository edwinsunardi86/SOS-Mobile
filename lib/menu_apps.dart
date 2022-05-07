import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_style/API/api_banner_ads.dart';
import 'package:text_style/component/sidebar.dart';
import 'component/custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:text_style/component/custom_background.dart';
import 'API/api_menu_apps.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_style/get_domain_ip.dart';

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
  late SharedPreferences? getData;
  late String getEmail;
  List<ApiBannerAds>? apiMenudAds;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        drawer: const Sidebar(),
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
                        return Column(
                          children: menuApps!
                              .map((ApiMenuApps menuApp) =>
                                  CustomButtonGradient(
                                    inputText: menuApp.menuAppsName,
                                    fontFamily: "Roboto",
                                    fontSize: 20,
                                    iconImage: menuApp.logoIcon,
                                    androidPackageName: menuApp.androidAppId,
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
                          return CarouselSlider(
                            items: apiMenudAds?.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return CachedNetworkImage(
                                    imageUrl: getDomainIpStatic.ipStatic +
                                        "storage/images/banner_ads/" +
                                        i.uploadImage,
                                    progressIndicatorBuilder:
                                        (_, url, download) {
                                      if (download.progress != null) {
                                        final percent =
                                            download.progress! * 100;
                                        return Text('$percent% done loading');
                                      } else {
                                        return const Text("");
                                      }
                                    },
                                  );
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(
                              aspectRatio: 18 / 6,
                              viewportFraction: 0.6,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 5000),
                              enlargeCenterPage: true,
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          ));
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
