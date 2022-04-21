import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomButtonGradient extends StatelessWidget {
  // const CustomButton({ Key? key }) : super(key: key);

  final String inputText;
  final String fontFamily;
  final double fontSize;
  final String iconImage;
  final String androidPackageName;
  const CustomButtonGradient(
      {this.inputText,
      this.fontFamily,
      this.fontSize,
      this.iconImage,
      this.androidPackageName});

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
                offset: Offset(3.0, 2.0),
                blurRadius: 5,
              ) //blur radius of shadow
            ]),
        child: ElevatedButton(
          onPressed: () async {
            //await LaunchApp.openApp(androidPackageName: androidPackageName);
            await LaunchApp.isAppInstalled(
                androidPackageName: androidPackageName);
          },
          child: Row(
            children: [
              iconImage != ""
                  ? Image(width: 50, height: 50, image: AssetImage(iconImage))
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
              primary: Colors.transparent,
              onSurface: Colors.transparent,
              shadowColor: Colors.transparent,
              fixedSize: const Size(250, 50)),
        ),
      ),
    );
  }
}

class CustomButtonGradientIconClass extends StatelessWidget {
  // const CustomButton({ Key? key }) : super(key: key);

  final String inputText;
  final String fontFamily;
  final double fontSize;
  final Icon iconClass;
  const CustomButtonGradientIconClass(
      {this.inputText, this.fontFamily, this.fontSize, this.iconClass});

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
              iconClass ?? const SizedBox.shrink(),
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

class CustomButtonCS extends StatelessWidget {
  // const CustomButton({ Key? key }) : super(key: key);

  final String inputText;
  final String fontFamily;
  final double fontSize;
  final String icon;

  const CustomButtonCS({
    this.inputText,
    this.fontFamily,
    this.fontSize,
    this.icon,
  });

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

class CustomButtonTransparent extends StatelessWidget {
  // const CustomButton({ Key? key }) : super(key: key);

  final String inputText;
  final String fontFamily;
  final double fontSize;
  const CustomButtonTransparent(
      {this.inputText, this.fontFamily, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(7),
        child: Align(
          alignment: Alignment.topRight,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              inputText,
              style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  shadows: const <Shadow>[
                    Shadow(color: Colors.black, offset: Offset(3.0, 2.0))
                  ]),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onSurface: Colors.transparent,
                shadowColor: Colors.transparent,
                maximumSize: const Size(126, 36)),
          ),
        ));
  }
}
