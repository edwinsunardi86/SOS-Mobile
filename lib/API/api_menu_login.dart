import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiLogin {
  static const ipStatic = "http://192.168.213.234:8000/";
  final String? email;
  final String? password;
  ApiLogin({this.email, this.password});

  factory ApiLogin.createPostLogin(Map<String, dynamic> object) {
    return ApiLogin(
        email: object['email']!.toString(),
        password: object['password']!.toString());
  }

  Future<http.Response> authentication(String email, String password) async {
    String apiURL = ipStatic + "api/login";

    http.Response apiResult = await http.post(
      Uri.parse(apiURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, dynamic>{
        "email": email,
        "password": password,
      }),
    );
    return apiResult;
  }

  Future<void> setupPreferences(String key, String value) async {
    SharedPreferences.setMockInitialValues(<String, String>{key: value});
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

  Future getPreferences(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }
}
