class FcMenuApps {
  final String menuAppsName;
  final String logoIcon;
  final String androidAppId;

  FcMenuApps(
      {required this.menuAppsName,
      required this.logoIcon,
      required this.androidAppId});

  factory FcMenuApps.createMenuApps(Map<String, dynamic> json) {
    return FcMenuApps(
        menuAppsName: json['menu_apps_name'],
        logoIcon: json['logo_icon'],
        androidAppId: json['android_app_id']);
  }
}
