import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiLogin {
  final String? email;
  final String? password;
  ApiLogin({required this.email, required this.password});

  factory ApiLogin.createPostLogin(Map<String, dynamic> object) {
    return ApiLogin(email: object['email'], password: object['password']);
  }

  static Future<ApiLogin> authentication(String email, String password) async {
    String apiURL = "http://192.168.3.13:8000/api/authentication";
    var apiResult = await http
        .post(Uri.parse(apiURL), body: {"email": email, "password": password});
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      return ApiLogin.createPostLogin(jsonObject);
    } else {
      throw "Unable to retrieve Menu Apps";
    }
  }
}
