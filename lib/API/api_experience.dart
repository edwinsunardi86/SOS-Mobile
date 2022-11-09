import 'dart:convert';
import 'package:text_style/get_domain_ip.dart';
import 'package:http/http.dart' as http;

class ApiExperience {
  String? id;
  String? experience;
  ApiExperience({this.id, this.experience});
  factory ApiExperience.createExperience(Map<String, dynamic> json) {
    return ApiExperience(id: json['id'], experience: json['experience']);
  }
  static Future<List<ApiExperience>> fetchExperience() async {
    GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    String urlApi = getDomainIpStatic.ipStatic + "api/get_experience";
    var response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<ApiExperience> cities = body
          .map((dynamic item) => ApiExperience.createExperience(item))
          .toList();
      return cities;
    } else {
      throw "Unable to retrieve experience";
    }
  }
}
