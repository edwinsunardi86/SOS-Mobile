import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButtonGradient extends StatelessWidget {
  // const CustomButton({ Key? key }) : super(key: key);

  final String inputText;
  final String fontFamily;
  final double fontSize;

  const CustomButtonGradient(
      {required this.inputText,
      required this.fontFamily,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor("#e5383b"),
                HexColor("#ba181b"),
                HexColor("#a4161a")
                //add more colors
              ]),
          borderRadius: BorderRadius.circular(15),
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
            const Icon(FontAwesomeIcons.userPlus),
            Container(
              margin: const EdgeInsets.all(5),
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
            fixedSize: const Size(250, 40)),
      ),
    );
  }
}
