enum AppRouteNameEnum {
  login,
}

extension PageRouteNameExtension on AppRouteNameEnum {
  String get name {
    switch (this) {

      case AppRouteNameEnum.login:
        return "/login_page";


      default:
        return "/login_page";
    }
  }
}
