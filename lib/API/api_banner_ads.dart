import 'dart:convert';
import 'package:text_style/get_domain_ip.dart';
import 'package:http/http.dart' as http;

class ApiBannerAds {
  final String title;
  final String uploadImage;
  final int isActive;
  final String description;

  ApiBannerAds(
      {required this.title,
      required this.uploadImage,
      required this.isActive,
      required this.description});

  factory ApiBannerAds.createBannerAds(Map<String, dynamic> json) {
    return ApiBannerAds(
        title: json['title'],
        uploadImage: json['upload_image'] ?? "",
        isActive: json['is_active'],
        description: json['description'] ?? "");
  }

  static Future<List<ApiBannerAds>> fetchBannerAds() async {
    GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    String urlApi = getDomainIpStatic.ipStatic + "api/banner_ads";
    var response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<ApiBannerAds> bannerAds = body
          .map((dynamic item) => ApiBannerAds.createBannerAds(item))
          .toList();
      return bannerAds;
    } else {
      throw "Unable to retrieve banner ads";
    }
  }
}
