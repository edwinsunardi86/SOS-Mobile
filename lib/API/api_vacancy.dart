import 'dart:convert';
import 'package:text_style/get_domain_ip.dart';
import 'package:http/http.dart' as http;

class ApiVacancy {
  String? vacancy;
  int? statusVacancy;
  String? uploadGambar;
  ApiVacancy(
      {required this.vacancy,
      required this.statusVacancy,
      required this.uploadGambar});

  factory ApiVacancy.createVacancy(Map<String, dynamic> json) {
    return ApiVacancy(
        vacancy: json['vacancy'] ?? '',
        statusVacancy: json['status_vacancy'],
        uploadGambar: json['upload_gambar']);
  }

  static Future<List<ApiVacancy>> fetchVacancy() async {
    GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    String urlApi = getDomainIpStatic.ipStatic + "api/vacancy";
    var response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<ApiVacancy> vacancy =
          body.map((dynamic item) => ApiVacancy.createVacancy(item)).toList();
      return vacancy;
    } else {
      throw "Unable to retrieve vacancy";
    }
  }
}
