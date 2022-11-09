import 'dart:convert';
import 'package:text_style/get_domain_ip.dart';
import 'package:http/http.dart' as http;

class ApiCities {
  String? id;
  String? city;
  ApiCities({required this.id, required this.city});
  factory ApiCities.createCities(Map<String, dynamic> json) {
    return ApiCities(id: json['id'], city: json['city']);
  }
  static Future<List<ApiCities>> fetchCities() async {
    GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    String urlApi = getDomainIpStatic.ipStatic + "api/get_city";
    var response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<ApiCities> cities =
          body.map((dynamic item) => ApiCities.createCities(item)).toList();
      return cities;
    } else {
      throw "Unable to retrieve cities";
    }
  }
}
