import 'package:flutter/material.dart';
import 'package:text_style/API/api_menu_login.dart';
import 'package:text_style/component/input_text.dart';
import 'package:text_style/main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:text_style/menu_apps.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class CustomFormLogin extends StatefulWidget {
  const CustomFormLogin({Key? key}) : super(key: key);

  @override
  State<CustomFormLogin> createState() => _CustomFormLoginState();
}

class _CustomFormLoginState extends State<CustomFormLogin> {
  ApiLogin apiLogin = ApiLogin();
  final _formKey = GlobalKey<FormState>();
  SharedPreferences? logindata;
  late bool newuser;
  late SharedPreferences? getData;
  late String getEmail;
  @override
  void initState() {
    super.initState();
    checkIfAlreadyLogin();
  }

  void checkIfAlreadyLogin() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata!.getBool('login') ?? true);

    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MenuApps()));
    }
  }

  //@override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Flexible(
            child: Container(
              // color: Colors.red,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Email",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 17,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                                offset: Offset(3.0, 2.0),
                              )
                            ])),
                  ),
                  InputTextFormValidatorV1(
                    verticalM: 5.0,
                    textValidatorEmpty: "Input email anda",
                    controller: emailController,
                    obscureText: false,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Password",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 17,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                  offset: Offset(3.0, 2.0),
                                )
                              ])),
                    ),
                  ),
                  InputTextFormValidatorV1(
                    verticalM: 5.0,
                    textValidatorEmpty: "Input password anda",
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text(
                          "Lupa Password?",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const MyApp();
                          }));
                        },
                      ),
                    ],
                  )),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              color: Colors.black,
                              blurStyle: BlurStyle.normal,
                              offset: Offset(3.0, 2.0),
                              blurRadius: 5)
                        ],
                        border: Border.all(width: 3, color: Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        gradient: LinearGradient(
                            colors: [
                              HexColor("#590d22"),
                              HexColor("#ba181b"),
                              HexColor("#a4161a")
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: ElevatedButton(
                      onPressed: () async {
                        final snackBar = SnackBar(
                            content: Row(
                          children: const [
                            CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("On processing"),
                          ],
                        ));
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          try {
                            var req = await apiLogin.authentication(
                                emailController.text, passwordController.text);
                            if (req.statusCode == 200) {
                              // memberSet!.add({'email': emailController.text});
                              // await apiLogin.setupPreferences(
                              //     'email', emailController.text);
                              // String email = emailController.text;

                              logindata!.setBool('login', false);
                              logindata!
                                  .setString('email', emailController.text);

                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      title: Text("Alert!",
                                          style:
                                              TextStyle(fontFamily: "Roboto")),
                                      content: Text("Login Successful",
                                          style:
                                              TextStyle(fontFamily: "Roboto")),
                                    );
                                  });
                              Future.delayed(const Duration(seconds: 5), () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MenuApps()));
                              });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(const Duration(seconds: 5),
                                        () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return const AlertDialog(
                                      title: Text(
                                        "Your email/password wrong",
                                        style: TextStyle(fontFamily: "Roboto"),
                                      ),
                                    );
                                  });
                            }
                          } on Exception {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(const Duration(seconds: 5),
                                      () {
                                    Navigator.of(context).pop(true);
                                  });
                                  return const AlertDialog(
                                    title: Text("Login failed",
                                        style: TextStyle(fontFamily: "Roboto")),
                                  );
                                });
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Submit",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(20),
                          fixedSize:
                              MaterialStateProperty.all(const Size(250, 50)),
                          alignment: Alignment.center,
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          )),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      "Dont have an account? Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            flex: 9)
      ]),
    );
  }

  // static Route<Object?> _dialogBuilder(
  //     BuildContext context, Object? arguments) {
  //   return DialogRoute<void>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         Future.delayed(const Duration(seconds: 2), () {
  //           Navigator.of(context).pop(true);
  //           Navigator.of(context).pushReplacement(MaterialPageRoute(
  //               builder: (BuildContext context) => const MenuApps()));
  //         });
  //         return const AlertDialog(
  //           title: Text('Warning!', style: TextStyle(fontFamily: "Roboto")),
  //           content: Text(
  //             'Login Successful',
  //             style: TextStyle(fontFamily: "Roboto"),
  //           ),
  //         );
  //       });
  // }
}
