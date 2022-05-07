import 'package:flutter/material.dart';

class InputTextFormValidatorV1 extends StatelessWidget {
  //const InputText({Key key}) : super(key: key);
  final double? verticalM;
  final double? horizontalM;
  final TextEditingController? controller;
  final String? textValidatorEmpty;
  final bool? obscureText;
  final Icon? icon;

  const InputTextFormValidatorV1(
      {Key? key,
      this.verticalM,
      this.horizontalM,
      this.controller,
      this.textValidatorEmpty,
      this.obscureText,
      this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: verticalM ?? 0, horizontal: horizontalM ?? 0),
      decoration: const BoxDecoration(boxShadow: [
        // BoxShadow(
        //     color: Colors.black, offset: Offset(3.0, 2.0), blurRadius: 5.0)
      ]),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return (value == null || value.isEmpty) ? textValidatorEmpty : null;
        },
        obscureText: (obscureText ?? false),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          prefixIcon: icon,
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2, color: Colors.red)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.blueAccent,
              )),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.white,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
