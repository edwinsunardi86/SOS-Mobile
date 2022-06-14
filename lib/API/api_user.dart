import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
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
      verifiedEmail: json['email_verified_at'] ?? "",
    );
  }

  // static Future<http.Response> postRegistrationUser(
  //     String username,
  //     String password,
  //     String email,
  //     String fullName,
  //     String noKtp,
  //     String noHandphone,
  //     String alamat) async {
  //   final GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
  //   String apiUrl = getDomainIpStatic.ipStatic + "api/store_user";
  //   http.Response response = await http.post(Uri.parse(apiUrl),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: json.encode(<String, String>{
  //         'username': username.toString(),
  //         'password': password.toString(),
  //         'email': email.toString(),
  //         'fullname': fullName.toString(),
  //         'no_ktp': noKtp.toString(),
  //         'no_handphone': noHandphone.toString(),
  //         'alamat': alamat.toString()
  //       }));
  //   return response;
  // }

  static Future<http.MultipartRequest> multiPartRegistrationUser(
      File? uploadImage,
      String username,
      String password,
      String email,
      String fullName,
      String noKtp,
      String noHandphone,
      String alamat) async {
    final GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    // final Map<String, String> headers = {'Content-Type': 'application/json'};
    // final Map<String, String> postData = {
    //   'username': username,
    //   'password': password,
    //   'email': email,
    //   'fullname': fullName,
    //   'no_ktp': noKtp,
    //   'no_handphone': noHandphone,
    //   'alamat': alamat
    // };
    String apiUrl = getDomainIpStatic.ipStatic + "api/store_user";
    var multiPartFile = http.MultipartFile.fromBytes(
        'file',
        (await rootBundle
                .load('assets/images/avatar_profile/avatar_profile.png'))
            .buffer
            .asUint8List(),
        filename: 'avatar_profile.png',
        contentType: MediaType('image', 'jpg'));
    // var uploadFile = uploadImage?.exists();
    late dynamic upload;

    // var uploadFileImage = uploadImage!.exists().then((value) {
    //   upload = uploadImage.path;
    // }).onError((error, stackTrace) {
    //   upload = multiPartFile;
    // });
    if (uploadImage!.path != "") {
      upload = await http.MultipartFile.fromPath('picture', uploadImage.path);
    } else {
      upload = multiPartFile;
    }
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
      ..fields['username'] = username
      ..fields['password'] = password
      ..fields['email'] = email
      ..fields['fullname'] = fullName
      ..fields['no_ktp'] = noKtp
      ..fields['no_handphone'] = noHandphone
      ..fields['alamat'] = alamat
      ..files.add(upload);
    return request;
  }

  static Future<http.Response> sendEmailVerification(
      String username, String email) async {
    final GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    String apiUrl = getDomainIpStatic.ipStatic +
        "api/resend_email_verification?username=" +
        username +
        "&email=" +
        email;
    http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      // body: json.encode(<String, dynamic>{
      //   'username': username.toString(),
      //   'email': email.toString()
      // })
    );
    return response;
  }

  // static Stream<http.Response> checkVerifiedEmail(String email) async* {
  //   yield* Stream.periodic(const Duration(seconds: 5), (_) {
  //     final GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
  //     String apiUrl = getDomainIpStatic.ipStatic + "api/store_user";
  //     return http.get(
  //       Uri.parse(apiUrl),
  //     );
  //   }).asyncMap((event) async => await event);
  // }
}
