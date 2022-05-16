import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:text_style/get_domain_ip.dart';

class ApiUser {
  //Map Field
  String? username,
      password,
      email,
      fullName,
      noKtp,
      noHandphone,
      alamat,
      verifiedEmail;

  //Map Message
  String? validationUsername,
      validationEmail,
      confirmationUsername,
      confirmationEmail;
  ApiUser(
      {this.username,
      this.password,
      this.email,
      this.alamat,
      this.fullName,
      this.noHandphone,
      this.noKtp,
      this.verifiedEmail,
      this.validationEmail,
      this.validationUsername,
      this.confirmationEmail,
      this.confirmationUsername});

  factory ApiUser.validationInput(Map<String, dynamic> json) {
    return ApiUser(
        validationUsername: json["validation_username"] ?? "",
        validationEmail: json["validation_email"] ?? "",
        confirmationEmail: json["confirmation_email"] ?? "",
        confirmationUsername: json["confirmation_username"] ?? "");
  }
  factory ApiUser.mapUser(Map<String, dynamic> json) {
    return ApiUser(
      username: json['username'] ?? "",
      password: json['password'] ?? "",
      email: json['email'] ?? "",
      alamat: json['alamat'] ?? "",
      fullName: json['fullname'] ?? "",
      noHandphone: json['no_handphone'] ?? "",
      noKtp: json['no_ktp'] ?? "",
      verifiedEmail: json['verified_email_at'] ?? "",
    );
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
    return response;
  }

  // static Future<http.Response> checkVerifiedEmail(String email) async {
  //   final GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
  //   String apiUrl = getDomainIpStatic.ipStatic + "api/check_verification_email";
  //   http.Response response = await http.post(Uri.parse(apiUrl),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8'
  //       },
  //       body: json.encode(<String, dynamic>{'email': email.toString()}));
  //   return response;
  // }

  static Stream<http.Response> checkVerifiedEmail(String email) async* {
    yield* Stream.periodic(const Duration(seconds: 5), (_) {
      final GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
      String apiUrl = getDomainIpStatic.ipStatic + "api/store_user";
      return http.get(
        Uri.parse(apiUrl),
      );
    }).asyncMap((event) async => await event);
  }
}
