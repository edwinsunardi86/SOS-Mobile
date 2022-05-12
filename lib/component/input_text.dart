import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextFormValidatorV1 extends StatelessWidget {
  //const InputText({Key key}) : super(key: key);

  final TextEditingController? controller;
  final String? textValidatorEmpty;
  final bool? obscureText;
  final Icon? icon;

  const InputTextFormValidatorV1(
      {Key? key,
      this.controller,
      this.textValidatorEmpty,
      this.obscureText,
      this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 15,
      //shadowColor: Colors.black,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return (value == null || value.isEmpty) ? textValidatorEmpty : null;
        },
        obscureText: (obscureText ?? false),
        cursorColor: Colors.black,
        decoration: InputDecoration(
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

class InputTextFormValidatorV2 extends StatelessWidget {
  //const InputText({Key key}) : super(key: key);
  final TextEditingController? controller;
  final bool? obscureText;
  final Icon? icon;
  final String? label;
  final String? Function(String?)? validators;
  final String? inputFormatter;

  const InputTextFormValidatorV2(
      {Key? key,
      this.controller,
      this.obscureText,
      this.icon,
      this.label,
      this.validators,
      this.inputFormatter})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      //shadowColor: Colors.black,
      child: TextFormField(
        controller: controller,
        validator: validators,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(inputFormatter ?? ""))
        ],
        obscureText: (obscureText ?? false),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          labelStyle: const TextStyle(color: Colors.black26),
          labelText: label,
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

class InputTextFormArea extends StatelessWidget {
  //const InputText({Key key}) : super(key: key);

  final TextEditingController? controller;
  final Icon? icon;
  final String? label;
  final int? maxLines;

  const InputTextFormArea(
      {Key? key, this.controller, this.icon, this.label, this.maxLines})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      shadowColor: Colors.black,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.black26),
          labelText: label,
          prefixIcon: icon,
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
