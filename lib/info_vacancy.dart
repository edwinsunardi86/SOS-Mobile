import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_style/API/api_banner.dart';
import 'package:text_style/API/api_user.dart';
import 'package:text_style/API/api_menu_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_style/API/api_vacancy.dart';
import 'package:text_style/component/sidebar.dart';
import 'package:text_style/component/custom_background.dart';
import 'package:text_style/get_domain_ip.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const InfoVacancy());
}

class InfoVacancy extends StatefulWidget {
  const InfoVacancy({Key? key}) : super(key: key);

  @override
  State<InfoVacancy> createState() => _InfoVacancyState();
}

class _InfoVacancyState extends State<InfoVacancy> {
  ApiUser? apiUser;
  ApiLogin? apiLogin;
  SharedPreferences? logindata;
  String? imageAvatar;
  String? photo;
  String? fullname;

  //late String imageAvatar = await logindata?.getString('foto').toString() ?? "";
  final GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      imageAvatar = logindata?.getString('foto').toString();
      photo = imageAvatar.toString();
      fullname = logindata?.getString('fullname').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        drawer: const Sidebar(),
        body: SingleChildScrollView(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      repeat: ImageRepeat.repeat,
                      image:
                          AssetImage("assets/images/background/red_grad.png"))),
              child: Column(children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                            width: 60,
                            image: AssetImage("assets/images/icons/karir.png")),
                        Text(
                          "Karir",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    const Text(
                      "Mencari Kerja Untuk Pekerja",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color.fromARGB(255, 211, 0, 0),
                          Color.fromARGB(255, 105, 0, 0),
                          Color.fromARGB(255, 54, 0, 0)
                        ])),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: ClipOval(
                                  child: Image.network(
                                    photo.toString() == "" || photo != null
                                        ? getDomainIpStatic.ipStatic +
                                            'images/accounts/' +
                                            photo.toString()
                                        : getDomainIpStatic.ipStatic +
                                            "images/accounts/avatar_profile.png",
                                    width: 90,
                                    height: 90,
                                    loadingBuilder: (BuildContext context,
                                        Widget image,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return image;
                                      return SizedBox(
                                        width: 350,
                                        height: 350,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Container(
                                        color: Colors.amber,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'Whoops!',
                                          style: TextStyle(fontSize: 30),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Selamat Datang,",
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    fullname.toString(),
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: FutureBuilder(
                              future: ApiBanner.fetchBanner(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<ApiBanner>> snapshot) {
                                if (snapshot.hasData) {
                                  List<ApiBanner>? apiBanner = snapshot.data;
                                  return CarouselSlider(
                                    items: apiBanner?.map((i) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return CachedNetworkImage(
                                            imageUrl:
                                                getDomainIpStatic.ipStatic +
                                                    "images/banner/" +
                                                    i.image!,
                                            progressIndicatorBuilder:
                                                (_, url, download) {
                                              if (download.progress != null) {
                                                final percent =
                                                    download.progress! * 100;
                                                return Text(
                                                    '$percent% done loading');
                                              } else {
                                                return const Text("");
                                              }
                                            },
                                          );
                                        },
                                      );
                                    }).toList(),
                                    options: CarouselOptions(
                                      height: 350,
                                      aspectRatio: 18 / 6,
                                      viewportFraction: 1,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      autoPlayInterval:
                                          const Duration(seconds: 5),
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
                              }),
                        ),
                        FutureBuilder(
                            future: ApiVacancy.fetchVacancy(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<ApiVacancy>> snapshot) {
                              if (snapshot.hasData) {
                                List<ApiVacancy>? apiVacancy = snapshot.data;
                                return Column(
                                  children: apiVacancy!
                                      .map((ApiVacancy apiObjVacancy) {
                                    return CachedNetworkImage(
                                        width: 300,
                                        imageUrl: getDomainIpStatic.ipStatic +
                                            "images/lowongan/" +
                                            apiObjVacancy.uploadGambar!
                                                .toString());
                                    //return Text("test");
                                  }).toList(),
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          child: const Text(
                            "Lamar",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    )),
              ])),
        ));
  }
}
