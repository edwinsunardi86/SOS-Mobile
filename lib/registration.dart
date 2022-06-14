import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_style/API/api_user.dart';
import 'package:text_style/API/api_menu_login.dart';
import 'package:text_style/component/custom_button.dart';
import 'package:text_style/component/custom_dialog_box.dart';
import 'package:text_style/component/input_text.dart';
import 'package:text_style/resend_email_verification.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:path_provider/path_provider.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  ApiUser? apiUser;
  ApiLogin? apiLogin;
  SharedPreferences? logindata;
  final _formKey = GlobalKey<FormState>();

  File? imageFile = null;
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

  final double? _initFabHeight = 120.0;
  double? _fabHeight = 0;
  double? _panelHeightOpen = 140;
  double? _panelHeightClosed = 35.0;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    // _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.black,
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder()
            })),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            // resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back)),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
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
                                ]))),
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
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _visible = true;
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        child: Container(
                                            width: 80,
                                            height: 80,
                                            color: const Color.fromARGB(
                                                255, 1, 0, 0),
                                            child: (imageFile == null)
                                                ? const Image(
                                                    isAntiAlias: true,
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        "https://e7.pngegg.com/pngimages/122/453/png-clipart-computer-icons-user-profile-avatar-female-profile-heroes-head.png"),
                                                  )
                                                : Image.file(
                                                    imageFile ?? File(''),
                                                    isAntiAlias: true,
                                                    filterQuality:
                                                        FilterQuality.high,
                                                    fit: BoxFit.cover)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(40)),
                                      ),
                                      const Positioned(
                                        left: 55,
                                        bottom: 0,
                                        child: Icon(Icons.add_a_photo,
                                            color: Colors.green),
                                      )
                                    ],
                                  ),
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
                                    }),
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
                                      var req = await ApiUser
                                          .multiPartRegistrationUser(
                                              imageFile ?? File(''),
                                              username.text,
                                              password.text,
                                              email.text,
                                              fullname.text,
                                              noKtp.text,
                                              noHandphone.text,
                                              alamat.text);
                                      //if (req.statusCode == 200) {
                                      var response = await req.send();
                                      if (response.statusCode == 200) {
                                        logindata = await SharedPreferences
                                            .getInstance();
                                        ApiLogin.getFieldUser(email.text)
                                            .then((value) => apiLogin = value);
                                        logindata!.setString('email',
                                            apiLogin?.email.toString() ?? "");
                                        logindata!.setString(
                                            'username',
                                            apiLogin?.username.toString() ??
                                                "");
                                        String respStr = await response.stream
                                            .bytesToString();
                                        var getdata = jsonDecode(respStr);
                                        var mappingUser =
                                            ApiUser.validationInput(getdata);
                                        //mappingUser.confirmationEmail;
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            String? message;
                                            if (mappingUser
                                                    .validationUsername ==
                                                "invalid") {
                                              message = mappingUser
                                                  .confirmationUsername;
                                            } else if (mappingUser
                                                    .validationEmail ==
                                                "invalid") {
                                              message =
                                                  mappingUser.confirmationEmail;
                                            } else if (mappingUser
                                                        .validationUsername ==
                                                    "valid" &&
                                                mappingUser.validationEmail ==
                                                    "valid") {
                                              message = "Registration Success";
                                            }
                                            return CustomDialogBox(
                                                title: "Warning!",
                                                description: message,
                                                text: "Oke");
                                          },
                                        );
                                        if (mappingUser.validationEmail ==
                                                "valid" &&
                                            mappingUser.validationUsername ==
                                                "valid") {
                                          Future.delayed(
                                              const Duration(seconds: 5), () {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(builder:
                                                    (BuildContext context) {
                                              return const ResendEmailVerification();
                                            }));
                                          });
                                        }
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const CustomDialogBox(
                                                title: "Warning!",
                                                description: "Error",
                                                text: "Oke");
                                          },
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
                ),
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  visible: _visible,
                  child: SlidingUpPanel(
                    //header: const Text("Tambah Photo Profile"),
                    maxHeight: _panelHeightOpen!,
                    minHeight: _panelHeightClosed!,
                    defaultPanelState: PanelState.OPEN,
                    // parallaxOffset: .5,
                    panel: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            enabled: true,
                            selectedColor: Colors.red,
                            dense: true,
                            visualDensity: const VisualDensity(vertical: -4),
                            title: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  alignment: Alignment.centerRight,
                                  child: const Icon(
                                    Icons.vertical_distribute,
                                    size: 15,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _visible = false;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.cancel,
                                      size: 15,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                              enabled: true,
                              selectedColor: Colors.red,
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -4),
                              title: const Text(
                                "Add Photo Profile By Camera",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: _getFromCamera),
                          const Divider(),
                          ListTile(
                            enabled: true,
                            selectedColor: Colors.red,
                            dense: true,
                            visualDensity: const VisualDensity(vertical: -4),
                            title: const Text(
                              "Add Photo Profile By Gallery",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: _getFromGallery,
                          )
                        ]),
                  ),
                ),
              ],
            )));
  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker.platform.getImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 100);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker.platform.getImage(
        source: ImageSource.camera,
        maxHeight: 1200,
        maxWidth: 1200,
        imageQuality: 100);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
