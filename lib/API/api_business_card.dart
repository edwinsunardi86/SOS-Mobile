import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:text_style/get_domain_ip.dart';

class ApiBusinessCard {
  final String nama;
  final String photo;
  final String jabatan;
  final String qrCode;
  ApiBusinessCard(
      {required this.nama,
      required this.photo,
      required this.jabatan,
      required this.qrCode});

  factory ApiBusinessCard.createBusinessCard(Map<String, dynamic> json) {
    return ApiBusinessCard(
        nama: json['kartu_nama'] ?? "",
        photo: json['kartu_foto'] ?? "",
        jabatan: json['kartu_jabatan'] ?? "",
        qrCode: json['kartu_qr_code'] ?? "");
  }

  static Future<List<ApiBusinessCard>> fetchBusinessCard() async {
    final GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    String apiURL = getDomainIpStatic.ipStatic + "api/api_data_kartu";
    var response = await http.get(Uri.parse(apiURL));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<ApiBusinessCard> businessCard = body
          .map((dynamic item) => ApiBusinessCard.createBusinessCard(item))
          .toList();
      return businessCard;
    } else {
      throw 'unable to retrieve Business Card';
    }
  }
}
