import 'dart:convert';
import 'package:text_style/get_domain_ip.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiLogin {
  final String? email;
  final String? password;
  final String? fullname;

  ApiLogin({this.email, this.password, this.fullname});

  factory ApiLogin.createPostLogin(Map<String, dynamic> object) {
    return ApiLogin(
        email: object['email'] ?? "",
        password: object['password'] ?? "",
        fullname: object['fullname'] ?? "");
  }

  Future<http.Response> authentication(String email, String password) async {
    GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    String apiURL = getDomainIpStatic.ipStatic + "api/authentication";

    http.Response apiResult = await http.post(
      Uri.parse(apiURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{
        "email": email.toString(),
        "password": password.toString(),
      }),
    );
    return apiResult;
  }

  // Future<void> setupPreferences(String key, String value) async {
  //   SharedPreferences.setMockInitialValues(<String, String>{key: value});
  //   final preferences = await SharedPreferences.getInstance();
  //   await preferences.setString(key, value);
  // }

  // Future getPreferences(String key) async {
  //   final preferences = await SharedPreferences.getInstance();
  //   return preferences.getString(key);
  // }

  static Future<ApiLogin> getFieldUser(String email) async {
    GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    String apiUrl = getDomainIpStatic.ipStatic + "api/getdetailuser";
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{
        "email": email.toString(),
      }),
    );
    var apiResult = jsonDecode(response.body);
    return ApiLogin.createPostLogin(apiResult);
  }
}
