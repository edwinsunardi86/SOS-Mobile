import 'package:flutter/material.dart';
import 'package:text_style/custom_background.dart';
import 'package:text_style/custom_button.dart';
import 'package:text_style/custom_logo.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Stack(children: [
      const CustomBackground(),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomLogo(),
            ],
          ),
          flex: 2,
        ),
        Flexible(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(children: const [
                Align(
                  alignment: Alignment.center,
                  child: Text("Login",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontSize: 25,
                          shadows: <Shadow>[
                            Shadow(
                              color: Colors.black,
                              blurRadius: 5.0,
                              offset: Offset(3.0, 2.0),
                            )
                          ])),
                ),
              ])),
          flex: 1,
        ),
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
                  Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(3.0, 2.0),
                          blurRadius: 5.0)
                    ]),
                    child: const TextField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        suffixText: "@sos.co.id",
                        prefixIcon: Icon(Icons.email),
                        focusedBorder: UnderlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.red,
                            )),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        alignLabelWithHint: true,
                      ),
                    ),
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
                  Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(3.0, 2.0),
                          blurRadius: 5.0)
                    ]),
                    child: const TextField(
                      obscureText: true,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.key),
                        focusedBorder: UnderlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.red,
                            )),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  Container(
                      // margin: const EdgeInsets.only(top: 0),
                      child: const CustomButtonTransparent(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    inputText: "Lupa Password?",
                  )),
                  Container(
                    margin: const EdgeInsets.only(top: 35),
                    child: const CustomButtonGradientIconClass(
                      inputText: "Login",
                      fontFamily: "Roboto",
                      fontSize: 17,
                      iconClass: Icon(Icons.login),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const CustomButtonGradientIconClass(
                      inputText: "Daftar",
                      fontFamily: "Roboto",
                      fontSize: 17,
                      iconClass: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            flex: 9),
      ])
    ])));
  }
}

// Column(
//   children: [
//     const Flexible(flex: 2, child: CustomLogo()),
//     Flexible(
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 50),
//           child: Column(
//             children: [
//               const Text("Login",
//                   style: TextStyle(
//                       fontFamily: "Roboto",
//                       color: Colors.white,
//                       fontSize: 25,
//                       shadows: <Shadow>[
//                         Shadow(
//                           color: Colors.black,
//                           blurRadius: 5.0,
//                           offset: Offset(3.0, 2.0),
//                         )
//                       ])),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text("Email",
//                       style: TextStyle(
//                           fontFamily: "Roboto",
//                           fontSize: 17,
//                           color: Colors.white,
//                           shadows: <Shadow>[
//                             Shadow(
//                               color: Colors.black,
//                               blurRadius: 5.0,
//                               offset: Offset(3.0, 2.0),
//                             )
//                           ])),
//                 ]),
//                   Container(
//                     decoration: const BoxDecoration(boxShadow: [
//                       BoxShadow(
//                           color: Colors.black,
//                           offset: Offset(3.0, 2.0),
//                           blurRadius: 5.0)
//                     ]),
//                     child: const TextField(
//                       cursorColor: Colors.white,
//                       decoration: InputDecoration(
//                           focusedBorder: UnderlineInputBorder(
//                               borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(10)),
//                               borderSide: BorderSide(
//                                 width: 3,
//                                 color: Colors.red,
//                               )),
//                           enabledBorder: UnderlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                                 Radius.circular(10)),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           alignLabelWithHint: true,
//                           label: Text(
//                             "Email",
//                             style: TextStyle(
//                               fontFamily: "Roboto",
//                               fontSize: 17,
//                               color: Colors.black26,
//                             ),
//                           )),
//                     ),
//                   ),
//                   const Text("Password",
//                       style: TextStyle(
//                           fontFamily: "Roboto",
//                           fontSize: 17,
//                           color: Colors.white,
//                           shadows: <Shadow>[
//                             Shadow(
//                               color: Colors.black,
//                               blurRadius: 5.0,
//                               offset: Offset(3.0, 2.0),
//                             )
//                           ])),
//                   Container(
//                     decoration: const BoxDecoration(boxShadow: [
//                       BoxShadow(
//                           color: Colors.black,
//                           offset: Offset(3.0, 2.0),
//                           blurRadius: 5.0)
//                     ]),
//                     child: const TextField(
//                       obscureText: true,
//                       cursorColor: Colors.white,
//                       decoration: InputDecoration(
//                           focusedBorder: UnderlineInputBorder(
//                               borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(10)),
//                               borderSide: BorderSide(
//                                 width: 3,
//                                 color: Colors.red,
//                               )),
//                           enabledBorder: UnderlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                                 Radius.circular(10)),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           alignLabelWithHint: true,
//                           label: Text(
//                             "Password",
//                             style: TextStyle(
//                               fontFamily: "Roboto",
//                               fontSize: 17,
//                               color: Colors.black26,
//                             ),
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ],

//         ),
//         flex: 6)
//   ],
// )
