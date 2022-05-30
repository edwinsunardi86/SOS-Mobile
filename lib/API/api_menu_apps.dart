import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:text_style/get_domain_ip.dart';

class ApiMenuApps {
  final String menuAppsName;
  final String logoIcon;
  final String? androidAppId;
  final String? webAppId;

  ApiMenuApps(
      {required this.menuAppsName,
      required this.logoIcon,
      required this.androidAppId,
      required this.webAppId});

  factory ApiMenuApps.createMenuApps(Map<String, dynamic> json) {
    return ApiMenuApps(
        menuAppsName: json['menu_apps_name'],
        logoIcon: json['logo_icon'] ?? "",
        androidAppId: json['android_app_id'],
        webAppId: json['web_app_id']);
  }
  static Future<List<ApiMenuApps>> fetchMenuApps() async {
    final GetDomainIpStatic getDomainIpStatic = GetDomainIpStatic();
    String apiURL = getDomainIpStatic.ipStatic + "api/menu_apps";
    var response = await http.get(Uri.parse(apiURL));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<ApiMenuApps> menuApps =
          body.map((dynamic item) => ApiMenuApps.createMenuApps(item)).toList();
      return menuApps;
    } else {
      throw "Unable to retrieve Menu Apps";
    }
  }
}
