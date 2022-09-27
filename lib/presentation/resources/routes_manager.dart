import 'package:clean_architecture/presentation/forgot_password/forgot_password_screen.dart';
import 'package:clean_architecture/presentation/login/Login_screen.dart';
import 'package:clean_architecture/presentation/main/main_screen.dart';
import 'package:clean_architecture/presentation/register/register_screen.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/splash/splash-screen.dart';
import 'package:clean_architecture/presentation/store_details/stor_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPassWordRoute = "/forgotPassWord";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutesManager.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesManager.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RoutesManager.forgotPassWordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPassWordScreen());
      case RoutesManager.mainRoute:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case RoutesManager.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StorDetailsScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() // todo check my usage
  {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text(AppString.noRouteFound)),
              body: Center(child: Text(AppString.noRouteFound)),
            ));
  }
}
