import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:text_style/get_domain_ip.dart';

class ApiRegistrationUser {
  String? username;
  String? password;
  String? email;
  String? fullName;
  String? noKtp;
  String? noHandphone;
  String? alamat;
  ApiRegistrationUser(
      {this.username,
      this.password,
      this.email,
      this.alamat,
      this.fullName,
      this.noHandphone,
      this.noKtp});

  factory ApiRegistrationUser.createRegistrationUser(
      Map<String, dynamic> json) {
    return ApiRegistrationUser(
        username: json["username"] ?? "",
        password: json['password'] ?? "",
        email: json['email'] ?? "",
        alamat: json['alamat'] ?? "",
        fullName: json['fullname'] ?? "",
        noHandphone: json['no_handphone'] ?? "",
        noKtp: json['no_ktp'] ?? "");
  }
  // static Future<List<ApiRegistrationUser>> postRegistrationUser(
  static Future<http.Response> postRegistrationUser(
      String username,
      String password,
      String email,
      String fullName,
      String noKtp,
      String noHandphone,
      String alamat) async {
    final GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    String apiUrl = getDomainIpStatic.ipStatic + "api/store_user";
    http.Response response = await http.post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(<String, String>{
          'username': username.toString(),
          'password': password.toString(),
          'email': email.toString(),
          'fullname': fullName.toString(),
          'no_ktp': noKtp.toString(),
          'no_handphone': noHandphone.toString(),
          'alamat': alamat.toString()
        }));
    if (response.statusCode == 200) {
      // List<dynamic> body = jsonDecode(response.body);
      // List<ApiRegistrationUser> apiRegistrationUser = body
      //     .map((dynamic item) =>
      //         ApiRegistrationUser.createRegistrationUser(item))
      //     .toList();
      // return apiRegistrationUser;
      var apiResult = jsonDecode(response.body);
      return apiResult;
    } else {
      throw 'Unable to retrieve User';
    }
  }
}
