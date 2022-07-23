import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
  final VoidCallback? onTap;

  const InputTextFormValidatorV2(
      {Key? key,
      this.controller,
      this.obscureText,
      this.icon,
      this.label,
      this.validators,
      this.inputFormatter,
      this.onTap})
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
        onTap: onTap,
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

class InputDatePicker extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscureText;
  final Icon? icon;
  final String? label;
  final String? inputFormatter;

  const InputDatePicker(
      {Key? key,
      this.controller,
      this.obscureText,
      this.icon,
      this.label,
      this.inputFormatter})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      //shadowColor: Colors.black,
      child: TextFormField(
        readOnly: true,
        controller: controller,
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
        onTap: () async {
          await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2015),
            lastDate: DateTime(2025),
          ).then((selectedDate) {
            if (selectedDate != null) {
              controller!.text = DateFormat('yyyy-MM-dd').format(selectedDate);
            }
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter date.';
          }
          return null;
        },
      ),
    );
  }
}

class InputDropDown extends StatefulWidget {
  const InputDropDown({Key? key}) : super(key: key);

  @override
  State<InputDropDown> createState() => _InputDropDownState();
}

class _InputDropDownState extends State<InputDropDown> {
  String dropdownValue = '';
  //List<DropdownMenuItem<String>>? items;
  List<String>? items;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      items: <String>items.map((e) => null),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
    );
  }
}
// class InputTextDatePicker extends StatefulWidget {
//   final TextEditingController? controller;
//   final bool? obscureText;
//   final Icon? icon;
//   final String? label;
//   final String? Function(String?)? validators;
//   final String? inputFormatter;
//   final String? restorationId;
//   const InputTextDatePicker(
//       {Key? key,
//       this.controller,
//       this.obscureText,
//       this.icon,
//       this.label,
//       this.validators,
//       this.inputFormatter,
//       this.restorationId})
//       : super(key: key);

//   @override
//   State<InputTextDatePicker> createState() => _InputTextDatePickerState();
// }

// class _InputTextDatePickerState extends State<InputTextDatePicker>
//     with RestorationMixin {
//   @override
//   String? get restorationId => widget.restorationId;

//   final RestorableDateTime _selectedDate =
//       RestorableDateTime(DateTime(2021, 7, 25));
//   late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
//       RestorableRouteFuture<DateTime?>(
//     onComplete: _selectDate,
//     onPresent: (NavigatorState navigator, Object? arguments) {
//       return navigator.restorablePush(
//         _datePickerRoute,
//         arguments: _selectedDate.value.millisecondsSinceEpoch,
//       );
//     },
//   );
//   static Route<DateTime> _datePickerRoute(
//     BuildContext context,
//     Object? arguments,
//   ) {
//     return DialogRoute<DateTime>(
//       context: context,
//       builder: (BuildContext context) {
//         return DatePickerDialog(
//           restorationId: 'date_picker_dialog',
//           initialEntryMode: DatePickerEntryMode.calendarOnly,
//           initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
//           firstDate: DateTime(2021),
//           lastDate: DateTime(2022),
//         );
//       },
//     );
//   }

//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     registerForRestoration(_selectedDate, 'selected_date');
//     registerForRestoration(
//         _restorableDatePickerRouteFuture, 'date_picker_route_future');
//   }

//   void _selectDate(DateTime? newSelectedDate) {
//     if (newSelectedDate != null) {
//       //widget.controller!.text = _selectedDate.value.toString();
//       setState(() {
//         widget.controller!.text = _selectedDate.value.toString();
//         // _selectedDate.value = newSelectedDate;
//         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         //   content: Text(
//         //       'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
//         // ));
//         // widget.controller!.text = _selectedDate.value.toString();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       elevation: 5,
//       //shadowColor: Colors.black,
//       child: TextFormField(
//         onTap: () {
//           _restorableDatePickerRouteFuture.present();
//         },
//         controller: widget.controller,
//         obscureText: (widget.obscureText ?? false),
//         cursorColor: Colors.black,
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
//           labelStyle: const TextStyle(color: Colors.black26),
//           labelText: widget.label,
//           prefixIcon: widget.icon,
//           errorBorder: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               borderSide: BorderSide(width: 2, color: Colors.red)),
//           focusedBorder: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               borderSide: BorderSide(
//                 width: 1,
//                 color: Colors.blueAccent,
//               )),
//           enabledBorder: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               borderSide: BorderSide.none),
//           filled: true,
//           fillColor: Colors.white,
//           alignLabelWithHint: true,
//         ),
//       ),
//     );
//   }
// }

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
