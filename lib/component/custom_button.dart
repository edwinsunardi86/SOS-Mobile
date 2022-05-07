import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:text_style/get_domain_ip.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomButtonGradient extends StatelessWidget {
  // const CustomButton({ Key? key }) : super(key: key);

  final String inputText;
  final String? fontFamily;
  final double? fontSize;
  final String? iconImage;
  final String? androidPackageName;

  const CustomButtonGradient({
    Key? key,
    required this.inputText,
    this.fontFamily = "Roboto",
    this.fontSize = 12,
    this.iconImage,
    this.androidPackageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    return Container(
      margin: const EdgeInsets.all(7),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  HexColor("#590d22"),
                  HexColor("#ba181b"),
                  HexColor("#a4161a")
                  //add more colors
                ]),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 3, color: Colors.white),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                offset: Offset(3.0, 2.0),
                blurRadius: 5,
              ) //blur radius of shadow
            ]),
        child: ElevatedButton(
          onPressed: () async {
            (androidPackageName != null)
                ? await LaunchApp.openApp(
                    androidPackageName: androidPackageName, openStore: false)
                : "";
          },
          child: Row(
            children: [
              iconImage != ""
                  ? CachedNetworkImage(
                      imageUrl: getDomainIpStatic.ipStatic +
                          "storage/images/logo_icon/" +
                          iconImage!,
                      progressIndicatorBuilder: (_, url, download) {
                        if (download.progress != null) {
                          final percent = download.progress! * 100;
                          return Text("$percent% done loading");
                        }
                        return const CircularProgressIndicator(
                          color: Colors.white,
                        );
                      },
                    )
                  : const SizedBox.shrink(),
              Container(
                margin: const EdgeInsets.all(2),
              ),
              Text(
                inputText,
                style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          style: ElevatedButton.styleFrom(
              elevation: 20,
              primary: Colors.transparent,
              onSurface: Colors.transparent,
              shadowColor: Colors.transparent,
              fixedSize: const Size(300, 50)),
        ),
      ),
    );
  }
}

class CustomButtonGradientIconClass extends StatelessWidget {
  // const CustomButton({ Key? key }) : super(key: key);

  final String inputText;
  final String? fontFamily;
  final double? fontSize;
  final IconData? iconClass;

  const CustomButtonGradientIconClass({
    Key? key,
    required this.inputText,
    this.fontFamily = "Roboto",
    this.fontSize = 12,
    this.iconClass = Icons.question_answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  HexColor("#590d22"),
                  HexColor("#ba181b"),
                  HexColor("#a4161a")
                  //add more colors
                ]),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 3, color: Colors.white),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5,
                  offset: Offset(3.0, 2.0),
                  spreadRadius: 3) //blur radius of shadow
            ]),
        child: ElevatedButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(iconClass),
              Container(
                margin: const EdgeInsets.all(2),
              ),
              Text(
                inputText,
                style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onSurface: Colors.transparent,
              shadowColor: Colors.transparent,
              fixedSize: const Size(250, 50)),
        ),
      ),
    );
  }
}

class CustomButtonWhite extends StatelessWidget {
  // const CustomButton({ Key? key }) : super(key: key);

  final String inputText;
  final String fontFamily;
  final double fontSize;
  final String icon;

  const CustomButtonWhite({
    Key? key,
    required this.inputText,
    this.fontFamily = "Roboto",
    this.fontSize = 12,
    this.icon = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 3, color: Colors.white),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ]),
        child: ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [
                ((icon != "")
                    ? Image(width: 50, height: 50, image: AssetImage(icon))
                    : const SizedBox.shrink()),
                Text(
                  inputText,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: fontFamily,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onSurface: Colors.transparent,
                shadowColor: Colors.transparent,
                fixedSize: const Size(300, 50))),
      ),
    );
  }
}

class CustomButtonAuthentication extends StatelessWidget {
  // const CustomButton({ Key? key }) : super(key: key);

  final String inputText;
  final String? fontFamily;
  final double? fontSize;
  final IconData? iconClass;

  const CustomButtonAuthentication({
    Key? key,
    required this.inputText,
    this.fontFamily,
    this.fontSize,
    this.iconClass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  HexColor("#590d22"),
                  HexColor("#ba181b"),
                  HexColor("#a4161a")
                  //add more colors
                ]),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 3, color: Colors.white),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5,
                  offset: Offset(3.0, 2.0),
                  spreadRadius: 3) //blur radius of shadow
            ]),
        child: ElevatedButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(iconClass),
              Container(
                margin: const EdgeInsets.all(2),
              ),
              Text(
                inputText,
                style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onSurface: Colors.transparent,
              shadowColor: Colors.transparent,
              fixedSize: const Size(250, 50)),
        ),
      ),
    );
  }
}
