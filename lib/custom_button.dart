import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomButtonGradient extends StatelessWidget {
  // const CustomButton({ Key? key }) : super(key: key);

  final String inputText;
  final String? fontFamily;
  final double? fontSize;
  final String? iconImage;
  final String? androidPackageName;
  const CustomButtonGradient(
      {required this.inputText,
      this.fontFamily = "Roboto",
      this.fontSize = 12,
      this.iconImage = "",
      this.androidPackageName = ""});

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
            await LaunchApp.openApp(
                androidPackageName: androidPackageName, openStore: false);
          },
          child: Row(
            children: [
              iconImage != ""
                  ? Image(
                      width: 50,
                      height: 50,
                      image: AssetImage(iconImage ?? 'test'))
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
  final String? fontFamily;
  final double? fontSize;
  final IconData? iconClass;

  const CustomButtonGradientIconClass(
      {required this.inputText,
      this.fontFamily = "Roboto",
      this.fontSize = 12,
      this.iconClass = Icons.question_answer});

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

class CustomButtonCS extends StatelessWidget {
  // const CustomButton({ Key? key }) : super(key: key);

  final String inputText;
  final String fontFamily;
  final double fontSize;
  final String icon;

  const CustomButtonCS({
    required this.inputText,
    this.fontFamily = "Roboto",
    this.fontSize = 12,
    this.icon = "",
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
  final String? fontFamily;
  final double? fontSize;
  const CustomButtonTransparent(
      {required this.inputText, this.fontFamily = null, this.fontSize = 11});

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

class CustomButtonValidation extends StatelessWidget {
  // const CustomButton({ Key? key }) : super(key: key);

  final String inputText;
  final String fontFamily;
  final double fontSize;
  final String iconImage;
  final String androidPackageName;
  const CustomButtonValidation(
      {required this.inputText,
      this.fontFamily = "Roboto",
      this.fontSize = 12,
      this.iconImage = "",
      this.androidPackageName = ""});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(content: Text('Processing Data')),
              // );
              double value = 0;
              CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: Colors.green,
                strokeWidth: 5,
                value: value,
              );
            }
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