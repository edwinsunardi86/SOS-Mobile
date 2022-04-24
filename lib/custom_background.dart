import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image(
          fit: BoxFit.fill,
          repeat: ImageRepeat.repeat,
          image: AssetImage("assets/images/background/red_grad.png"),
        ));
  }
}
