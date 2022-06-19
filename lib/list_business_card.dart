import 'package:flutter/material.dart';
import 'API/api_business_card.dart';
import 'package:text_style/component/custom_background.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:text_style/get_domain_ip.dart';
import 'package:text_style/component/custom_dialog_box.dart';
import 'package:text_style/component/custom_image_dialog.dart';

class BusinessCardList extends StatelessWidget {
  const BusinessCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    // final listTile = <Widget>[
    //   GestureDetector(
    //     onTap: () async {
    //       Navigator.push(context,
    //           MaterialPageRoute(builder: (BuildContext context) {
    //         return WebViewAndroid(
    //           urlDirect:
    //               "http://203.176.177.251/dnc/index4.php?tkn=herman.julianto",
    //         );
    //       }));
    //     },
    //     child: Container(
    //       margin: const EdgeInsets.all(5),
    //       color: Colors.white70,
    //       child: const ListTile(
    //         selectedColor: Colors.black,
    //         tileColor: Colors.blueAccent,
    //         leading: Image(
    //             image: NetworkImage(
    //                 'https://img2.pngdownload.id/20180523/tha/kisspng-businessperson-computer-icons-avatar-clip-art-lattice-5b0508dc6a3a10.0013931115270566044351.jpg')),
    //         title: Text(
    //           'Herman Julianto',
    //           style: TextStyle(color: Colors.black),
    //         ),
    //         subtitle: Text('President Director',
    //             style: TextStyle(color: Colors.black)),
    //       ),
    //     ),
    //   ),
    //   Container(
    //     margin: EdgeInsets.all(5),
    //     color: Colors.white70,
    //     child: const ListTile(
    //       selectedColor: Colors.black,
    //       tileColor: Colors.blueAccent,
    //       leading: Image(
    //           image: NetworkImage(
    //               'https://img2.pngdownload.id/20180523/tha/kisspng-businessperson-computer-icons-avatar-clip-art-lattice-5b0508dc6a3a10.0013931115270566044351.jpg')),
    //       title: Text(
    //         'Indera Sanjaya',
    //         style: TextStyle(color: Colors.black),
    //       ),
    //       subtitle: Text('Director Sales & Marketing',
    //           style: TextStyle(color: Colors.black)),
    //     ),
    //   )
    // ];
    return Scaffold(
      body: Stack(
        children: [
          const CustomBackground(),
          Column(
            children: [
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
                flex: 8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Business Card",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      ),
                      // ListView(
                      //   scrollDirection: Axis.vertical,
                      //   children: listTile,
                      //   shrinkWrap: true,
                      // ),
                      FutureBuilder(
                        future: ApiBusinessCard.fetchBusinessCard(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<ApiBusinessCard>> snapshot) {
                          if (snapshot.hasData) {
                            List<ApiBusinessCard>? apiBusinessCard =
                                snapshot.data;
                            final listTile = apiBusinessCard!
                                .map((ApiBusinessCard apiBusinessCard) {
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ImageDialog(
                                            imageUrl: apiBusinessCard.qrCode !=
                                                    ""
                                                ? getDomainIpStatic.ipStatic +
                                                    "storage/images/qr_foto/" +
                                                    apiBusinessCard.qrCode
                                                : "");
                                      });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  color: Colors.white70,
                                  child: ListTile(
                                    leading: CachedNetworkImage(
                                        // imageUrl: getDomainIpStatic.ipStatic +
                                        //     "storage/images/kartu_foto/" +
                                        //     apiBusinessCard.photo,
                                        width: 80,
                                        imageUrl: apiBusinessCard.photo != ""
                                            ? getDomainIpStatic.ipStatic +
                                                "storage/images/kartu_foto/" +
                                                apiBusinessCard.photo
                                            : getDomainIpStatic.ipStatic +
                                                "storage/images/avatar_profile/avatar_profile.png",
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
                                        }),
                                    title: Text(apiBusinessCard.nama),
                                    subtitle: Text(apiBusinessCard.jabatan),
                                  ),
                                ),
                              );
                            });
                            return ListView(
                              children: listTile.toList(),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
