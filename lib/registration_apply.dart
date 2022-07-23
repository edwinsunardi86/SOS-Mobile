import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:text_style/component/sidebar.dart';
import 'package:text_style/component/input_text.dart';

class RegistrationApply extends StatefulWidget {
  const RegistrationApply({Key? key}) : super(key: key);

  @override
  State<RegistrationApply> createState() => _RegistrationApplyState();
}

class _RegistrationApplyState extends State<RegistrationApply> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _dateTime;
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    TextEditingController fullname = TextEditingController();
    TextEditingController dateTime = TextEditingController();
    TextEditingController _dateController = TextEditingController();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        drawer: const Sidebar(),
        body: SingleChildScrollView(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      repeat: ImageRepeat.repeat,
                      image:
                          AssetImage("assets/images/background/red_grad.png"))),
              child: Column(children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                            width: 60,
                            image: AssetImage("assets/images/icons/karir.png")),
                        Text(
                          "Karir",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    const Text(
                      "Mencari Kerja Untuk Pekerja",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text("Formulir Data",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold)),
                        ),
                        InputTextFormValidatorV2(
                            controller: fullname,
                            label: "Nama Lengkap",
                            icon: const Icon(
                              Icons.account_circle,
                              color: Colors.black26,
                            ),
                            validators: (value) {
                              if (value!.isEmpty) {
                                return "Please input your full name";
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        InputTextFormValidatorV2(
                            controller: fullname,
                            label: "No. HP / WA",
                            icon: const Icon(
                              Icons.contact_phone,
                              color: Colors.black26,
                            ),
                            validators: (value) {
                              if (value!.isEmpty) {
                                return "Please input your full name";
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        InputDatePicker(
                          controller: dateTime,
                          label: "Birth Date",
                          icon: const Icon(Icons.calendar_month),
                        )
                      ],
                    ),
                  ),
                )
              ])),
        ));
  }
}
