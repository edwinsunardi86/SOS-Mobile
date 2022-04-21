import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Image(width: 110, image: AssetImage("assets/images/LOGO-PT-SOS.png")),
        Text("MOBILE",
            style: TextStyle(
                letterSpacing: 6,
                color: Colors.white,
                fontFamily: "Roboto",
                fontSize: 17,
                fontWeight: FontWeight.w800)),
      ],
    );
  }
}
