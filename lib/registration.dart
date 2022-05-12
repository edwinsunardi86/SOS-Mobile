import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_style/API/api_registration_user.dart';
import 'package:text_style/component/custom_button.dart';
import 'package:text_style/component/custom_dialog_box.dart';
import 'package:text_style/component/input_text.dart';
import 'package:text_style/component/sidebar.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  //ButtonBackgroundColor btnColor = ButtonBackgroundColor(context);
  TextEditingController fullname = TextEditingController();
  TextEditingController noHandphone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController noKtp = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController uploadPhoto = TextEditingController();

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            // resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            drawer: const Sidebar(),
            body: SingleChildScrollView(
              reverse: true,
              child: Form(
                key: _formKey,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          repeat: ImageRepeat.repeat,
                          image: AssetImage(
                              "assets/images/background/red_grad.png"))),
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 50),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                                width: 110,
                                image: AssetImage(
                                    "assets/images/LOGO-PT-SOS.png")),
                            Text("MOBILE",
                                style: TextStyle(
                                    letterSpacing: 6,
                                    color: Colors.white,
                                    fontFamily: "Roboto",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const Text(
                              "Registration",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Roboto",
                                  fontSize: 20),
                            ),
                            const SizedBox(height: 20),
                            InputTextFormValidatorV2(
                              controller: fullname,
                              label: "Nama sesuai KTP",
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
                              },
                            ),
                            const SizedBox(height: 20),
                            InputTextFormValidatorV2(
                              controller: noHandphone,
                              label: "No. Handphone",
                              icon: const Icon(
                                Icons.mobile_friendly,
                                color: Colors.black26,
                              ),
                            ),
                            const SizedBox(height: 20),
                            InputTextFormValidatorV2(
                              controller: noKtp,
                              label: "No.KTP",
                              icon: const Icon(
                                Icons.perm_identity,
                                color: Colors.black26,
                              ),
                            ),
                            const SizedBox(height: 20),
                            InputTextFormValidatorV2(
                                inputFormatter: r'[\s]',
                                controller: email,
                                label: "Email",
                                icon: const Icon(
                                  Icons.email,
                                  color: Colors.black26,
                                ),
                                validators: (value) {
                                  if (value!.isEmpty) {
                                    return "Please input email!";
                                  } else {
                                    RegExp regex = RegExp(
                                        r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                                    if (regex.hasMatch(value)) {
                                      return null;
                                    } else {
                                      return 'You have entered an invalid email address!';
                                    }
                                  }
                                }),
                            const SizedBox(height: 20),
                            InputTextFormArea(
                              controller: alamat,
                              label: "Alamat",
                              icon: const Icon(
                                Icons.home,
                                color: Colors.black26,
                              ),
                              maxLines: 4,
                            ),
                            const SizedBox(height: 20),
                            InputTextFormValidatorV2(
                              inputFormatter: r'[\s]',
                              controller: username,
                              label: "Username",
                              icon: const Icon(
                                Icons.account_circle,
                                color: Colors.black26,
                              ),
                              validators: (value) {
                                if (value!.isEmpty) {
                                  return 'Please input username!';
                                } else {
                                  RegExp regex = RegExp(r'^[a-zA-Z0-9]');
                                  if (regex.hasMatch(value)) {
                                    return null;
                                  } else {
                                    return 'Username must not have space character';
                                  }
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            InputTextFormValidatorV2(
                                controller: password,
                                inputFormatter: r'[\s]',
                                obscureText: true,
                                label: "Password",
                                icon: const Icon(
                                  Icons.password,
                                  color: Colors.black26,
                                ),
                                validators: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please input Password';
                                  } else {
                                    RegExp regex = RegExp(r'^[a-zA-Z0-9]');
                                    if (regex.hasMatch(value)) {
                                      return null;
                                    } else {
                                      return 'Password must not have space character';
                                    }
                                  }
                                }),
                            const SizedBox(height: 20),
                            InputTextFormValidatorV2(
                                controller: repassword,
                                inputFormatter: r'[\s]',
                                obscureText: true,
                                label: "Re-Password",
                                icon: const Icon(
                                  Icons.password,
                                  color: Colors.black26,
                                ),
                                validators: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please input Password';
                                  } else {
                                    String a = value;
                                    String b = password.text;
                                    if (a == b) {
                                      return null;
                                    } else {
                                      return 'Passwords do not match.';
                                    }
                                  }
                                }),
                            const SizedBox(height: 20),
                            CustomButtonGradientIconClass(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  var req = await ApiRegistrationUser
                                      .postRegistrationUser(
                                          username.text,
                                          password.text,
                                          email.text,
                                          fullname.text,
                                          noKtp.text,
                                          noHandphone.text,
                                          alamat.text);
                                  if (req.statusCode == 200) {
                                    const CustomDialogBox(
                                      title: "Perhatian",
                                      description:
                                          "Registration User Success! Please check your email for a verified link.",
                                      text: "OKE",
                                    );
                                  }
                                }
                              },
                              inputText: "Submit",
                              iconClass: Icons.input,
                            )
                          ],
                        )),
                  ]),
                ),
              ),
            )));
  }
}
