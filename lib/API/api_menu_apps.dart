import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiMenuApps {
  static const ipStatic = "http://192.168.213.234:8000/";
  final String menuAppsName;
  final String logoIcon;
  final String androidAppId;

  ApiMenuApps(
      {required this.menuAppsName,
      required this.logoIcon,
      required this.androidAppId});

  factory ApiMenuApps.createMenuApps(Map<String, dynamic> json) {
    return ApiMenuApps(
        menuAppsName: json['menu_apps_name'],
        logoIcon: json['logo_icon'] ?? "",
        androidAppId: json['android_app_id'] ?? "");
  }
  static Future<List<ApiMenuApps>> fetchMenuApps() async {
    String apiURL = ipStatic + "api/menu_apps";
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
