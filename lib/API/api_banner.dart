import 'dart:convert';
import 'package:text_style/get_domain_ip.dart';
import 'package:http/http.dart' as http;

class ApiBanner {
  String? name;
  int? active;
  String? image;
  String? kategori;
  String? url;
  String? lowongan;
  String? berita;
  ApiBanner(
      {required this.name,
      required this.active,
      required this.image,
      required this.kategori,
      required this.url,
      required this.lowongan,
      required this.berita});

  factory ApiBanner.createBanner(Map<String, dynamic> json) {
    return ApiBanner(
        name: json['name'] ?? '',
        active: json['active'],
        image: json['image'] ?? '',
        kategori: json['kategori'] ?? '',
        url: json['url'] ?? '',
        lowongan: json['lowongan'] ?? '',
        berita: json['berita'] ?? '');
  }

  static Future<List<ApiBanner>> fetchBanner() async {
    GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    String urlApi = getDomainIpStatic.ipStatic + "api/banner";
    var response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<ApiBanner> banner =
          body.map((dynamic item) => ApiBanner.createBanner(item)).toList();
      return banner;
    }
    throw "Unable to retrieve banner";
  }
}
