import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_style/component/custom_background.dart';
import 'package:text_style/component/input_text.dart';
import 'package:text_style/component/material_state/material_state.dart';
import 'package:text_style/component/sidebar.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  //ButtonBackgroundColor btnColor = ButtonBackgroundColor(context);
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
          resizeToAvoidBottomInset: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
          drawer: const Sidebar(),
          body: Stack(
            children: [
              const CustomBackground(),
              Column(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                              width: 110,
                              image:
                                  AssetImage("assets/images/LOGO-PT-SOS.png")),
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
                  Flexible(
                    flex: 9,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        const Text(
                          "Registration",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                        textInputUsername()
                      ]),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  TextFormField textInputUsername() {
    return TextFormField(
        validator: (value) {
          RegExp regex = RegExp(r'^[a-zA-Z0-9]');
          if (!regex.hasMatch(value!)) {
            return 'Username must not have space character';
          } else {
            return null;
          }
        },
        obscureText: false,
        cursorColor: Colors.black,
        decoration: const InputDecoration(
          labelText: "Username",
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          prefixIcon: Icon(Icons.supervised_user_circle_sharp),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2, color: Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.blueAccent,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.white,
          alignLabelWithHint: true,
        ));
  }
}
