import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:text_style/factory/fc_menu_apps.dart';

class ApiMenuApps {
  // Future<FcMenuApps> get getConnection async {
  //   final response = await http.get(Uri.parse(urlHTTP!));

  //   if (response.statusCode == 200) {
  //     return FcMenuApps.fromJSON(jsonDecode(response.body));
  //   } else {
  //     throw Exception("failed");
  //   }
  // }
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
        logoIcon: json['logo_icon'] == null ? "" : json['logo_icon'],
        androidAppId:
            json['android_app_id'] == null ? "" : json['android_app_id']);
  }
  static Future<List<ApiMenuApps>> fetchMenuApps() async {
    String apiURL = "http://127.0.0.1:8000/api/menu_apps";
    var response = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(response.body);
    //List<dynamic> listMenuApps = (jsonObject as Map<String, dynamic>)['data'];

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<ApiMenuApps> menuApps =
          body.map((dynamic item) => ApiMenuApps.createMenuApps(item)).toList();
      return menuApps;
    } else {
      throw "Unable to retrieve Menu Apps";
    }
    // List

    // List<Post> posts = body
    //     .map(
    //       (dynamic item) => Post.fromJson(item),
    //     )
    //     .toList();
    // for (int i = 0; i < listMenuApps.length; i++) {
    //   listMenuApps.add(FcMenuApps.createMenuApps(listMenuApps[i]));
    // }

    // return listMenuApps;
  }
}
