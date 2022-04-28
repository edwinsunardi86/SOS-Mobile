import 'package:flutter/material.dart';
import 'package:text_style/API/api_menu_login.dart';
import 'package:text_style/component/input_text.dart';
import 'package:text_style/component/custom_button.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class CustomFormLogin extends StatefulWidget {
  const CustomFormLogin({Key? key}) : super(key: key);

  @override
  State<CustomFormLogin> createState() => _CustomFormLoginState();
}

class _CustomFormLoginState extends State<CustomFormLogin> {
  final _formKey = GlobalKey<FormState>();
  bool submitting = false;
  ApiLogin? apiLogin;
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
                  const SizedBox(
                    height: 20,
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
                  Container(
                      margin: const EdgeInsets.only(top: 0),
                      child: const CustomButtonTransparent(
                        fontFamily: "Roboto",
                        fontSize: 12,
                        inputText: "Lupa Password?",
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 35),
                      child: Column(
                        children: [
                          Text(
                            (apiLogin != null)
                                ? apiLogin!.email.toString() +
                                    ' ' +
                                    apiLogin!.password.toString()
                                : "tidak ada data",
                            style:
                                const TextStyle(backgroundColor: Colors.green),
                          ),
                          ElevatedButton(
                              child: null,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  setState(() {
                                    ApiLogin.authentication(
                                            emailController.text,
                                            passwordController.text)
                                        .then((value) {
                                      apiLogin ?? "";

                                      apiLogin = value;
                                    });
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Row(
                                      children: const [
                                        SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 5.0,
                                          ),
                                        ),
                                        Text('Processing Data'),
                                      ],
                                    )),
                                  );
                                }

                                // Validate returns true if the form is valid, or false otherwise.
                              }),
                        ],
                      )
                      // child: const CustomButtonValidation(
                      //   inputText: "Login",
                      //   fontFamily: "Roboto",
                      //   fontSize: 17,
                      //   iconClass: Icon(Icons.login),
                      // ),
                      ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const CustomButtonGradientIconClass(
                      inputText: "Daftar",
                      fontFamily: "Roboto",
                      fontSize: 17,
                      iconClass: Icons.list,
                    ),
                  ),
                  // const SizedBox(
                  //     // margin: const EdgeInsets.only(top: 0),
                  //     child: CustomButtonTransparent(
                  //   fontFamily: "Roboto",
                  //   fontSize: 12,
                  //   inputText: "Lupa Password?",
                  // )),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 35),
                  //   child: const CustomButtonGradientIconClass(
                  //     inputText: "Login",
                  //     fontFamily: "Roboto",
                  //     fontSize: 17,
                  //     iconClass: Icon(Icons.login),
                  //   ),
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 10),
                  //   child: const CustomButtonGradientIconClass(
                  //     inputText: "Daftar",
                  //     fontFamily: "Roboto",
                  //     fontSize: 17,
                  //     iconClass: Icon(Icons.add),
                  //   ),
                  // ),
                ],
              ),
            ),
            flex: 9)
      ]),
    );
  }
}
