import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
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

class Registration extends StatefulWidget {
  const Registration({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  List<XFile>? _imageFileList;
  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;
  String? _retrieveDataError;
  final ImagePicker _picker = ImagePicker();

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 80,
          maxHeight: 80,
          imageQuality: 100);
      setState(() {
        _setImageFileListFromFile(pickedFile);
      });
    } catch (e) {
      _pickImageError = e;
    }
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      return result;
    }
    return null;
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Semantics(
        label: 'Pick Photo Gallery',
        child: ListView.builder(
          shrinkWrap: true,
          key: UniqueKey(),
          itemBuilder: (BuildContext? context, int index) {
            return Semantics(
                label: 'Pick Photo Gallery',
                child: kIsWeb
                    ? Image.network(_imageFileList![index].path)
                    : Image.file(File(_imageFileList![index].path)));
          },
          itemCount: _imageFileList!.length,
        ),
      );
    } else if (_pickImageError != null) {
      return Text('Pick image error:$_pickImageError',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white));
    } else {
      return const Text('You have not yet picked an image.',
          textAlign: TextAlign.center, style: TextStyle(color: Colors.white));
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }

    setState(() {
      if (response.files == null) {
        _setImageFileListFromFile(response.file);
      } else {
        _imageFileList = response.files;
      }
    });
  }

  ApiUser? apiUser;
  ApiLogin? apiLogin;
  SharedPreferences? logindata;
  final _formKey = GlobalKey<FormState>();

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
                            Center(
                                child: !kIsWeb &&
                                        defaultTargetPlatform ==
                                            TargetPlatform.android
                                    ? FutureBuilder<void>(
                                        future: retrieveLostData(),
                                        builder: (BuildContext? context,
                                            AsyncSnapshot<void> snapshot) {
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.none:
                                            case ConnectionState.waiting:
                                              return const Text(
                                                  "You have not yet picked image");
                                            case ConnectionState.active:

                                            case ConnectionState.done:
                                              return _previewImages();
                                            default:
                                              if (snapshot.hasError) {
                                                return const Text(
                                                    'Pick image error');
                                              } else {
                                                return const Text(
                                                    'You have not yet picked image');
                                              }
                                          }
                                        })
                                    : _previewImages()),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: FloatingActionButton(
                                onPressed: () {
                                  _onImageButtonPressed(
                                    ImageSource.gallery,
                                    context: context,
                                  );
                                },
                                heroTag: 'image1',
                                tooltip: 'Pick Multiple Image from gallery',
                                child: const Icon(Icons.photo_library),
                              ),
                            ),
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
                                // if (_formKey.currentState!.validate()) {
                                //   var req =
                                //       await ApiUser.multiPartRegistrationUser(
                                //           username.text,
                                //           password.text,
                                //           email.text,
                                //           fullname.text,
                                //           noKtp.text,
                                //           noHandphone.text,
                                //           alamat.text);
                                //   //if (req.statusCode == 200) {
                                //   if (req.statusCode == 200) {
                                //     logindata =
                                //         await SharedPreferences.getInstance();
                                //     ApiLogin.getFieldUser(email.text)
                                //         .then((value) => apiLogin = value);
                                //     logindata!.setString('email',
                                //         apiLogin?.email.toString() ?? "");
                                //     logindata!.setString('username',
                                //         apiLogin?.username.toString() ?? "");
                                //     var getdata = jsonDecode(req.body);
                                //     var mappingUser =
                                //         ApiUser.validationInput(getdata);
                                //     //mappingUser.confirmationEmail;
                                //     showDialog(
                                //       context: context,
                                //       builder: (BuildContext context) {
                                //         String? message;
                                //         if (mappingUser.validationUsername ==
                                //             "invalid") {
                                //           message =
                                //               mappingUser.confirmationUsername;
                                //         } else if (mappingUser
                                //                 .validationEmail ==
                                //             "invalid") {
                                //           message =
                                //               mappingUser.confirmationEmail;
                                //         } else if (mappingUser
                                //                     .validationUsername ==
                                //                 "valid" &&
                                //             mappingUser.validationEmail ==
                                //                 "valid") {
                                //           message = "Registration Success";
                                //         }
                                //         return CustomDialogBox(
                                //             title: "Warning!",
                                //             description: message,
                                //             text: "Oke");
                                //       },
                                //     );
                                //     if (mappingUser.validationEmail ==
                                //             "valid" &&
                                //         mappingUser.validationUsername ==
                                //             "valid") {
                                //       Future.delayed(const Duration(seconds: 5),
                                //           () {
                                //         Navigator.pushReplacement(context,
                                //             MaterialPageRoute(builder:
                                //                 (BuildContext context) {
                                //           return const ResendEmailVerification();
                                //         }));
                                //       });
                                //     }
                                //   } else {
                                //     showDialog(
                                //       context: context,
                                //       builder: (BuildContext context) {
                                //         return const CustomDialogBox(
                                //             title: "Warning!",
                                //             description: "Error",
                                //             text: "Oke");
                                //       },
                                //     );
                                //   }

                                // }
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
