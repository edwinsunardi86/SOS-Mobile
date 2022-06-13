import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_style/API/api_menu_login.dart';
import 'package:text_style/login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:text_style/webview_android.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  late SharedPreferences logindata;
  String? email;
  ApiLogin? apiLogin;
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata.getString('email') ?? "";
      ApiLogin.getFieldUser(email.toString()).then((value) {
        apiLogin = value;
        setState(() {});
      });
    });
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 37, 0, 0),
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromARGB(255, 99, 0, 0),
                  Color.fromARGB(255, 123, 0, 0),
                  Color.fromARGB(255, 149, 0, 0)
                ])),
            accountName: Text(apiLogin?.fullname ?? ""),
            accountEmail: Text(email.toString()),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://cdn.dribbble.com/users/2364329/screenshots/4759681/dribbble-11.jpg",
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
          ),
          ListTile(
            tileColor: const Color.fromARGB(255, 127, 0, 0),
            leading: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            title: const Text(
              'Favorites',
              style: TextStyle(color: Colors.white, fontFamily: "Roboto"),
            ),
            onTap: () => () {},
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            tileColor: const Color.fromARGB(255, 127, 0, 0),
            leading: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.white, fontFamily: "Roboto"),
            ),
            onTap: () async {
              await logindata.setBool('login', true);
              await logindata.remove('email');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginApp()));
            },
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            tileColor: const Color.fromARGB(255, 127, 0, 0),
            leading: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: const Text(
              'Business Card',
              style: TextStyle(color: Colors.white, fontFamily: "Roboto"),
            ),
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return WebViewAndroid(
                  urlDirect:
                      "http://203.176.177.251/dnc/index4.php?tkn=herman.julianto",
                );
              }));
            },
          )
        ],
      ),
    );
  }
}
