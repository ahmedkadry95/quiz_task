import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/app/auth/log_In/login_view.dart';
import 'package:task/app/auth/register/register_view.dart';
import 'package:task/app/home/view/home_view.dart';
import 'package:task/app/log/view/log_view.dart';
import 'package:task/app/play/view/play_view.dart';
import 'package:task/app/splash/view/splash_view.dart';
import 'package:task/routs/routing_data.dart';
import 'package:task/routs/routs_names.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uriData = Uri.parse(settings.name!);

    print('settings.name ${settings.name}');

    var routingData = RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );

    switch (routingData.route) {
      case RouteName.splash:
        return _getPageRoute(const SplashView(), settings);
      case RouteName.logIn:
        return _getPageRoute(const LogInView(), settings);
      case RouteName.register:
        return _getPageRoute(const RegisterView(), settings);
      case RouteName.home:
        return _getPageRoute(const HomeView(), settings);
      case RouteName.play:
        return _getPageRoute(const PlayView(), settings);
      case RouteName.log:
        return _getPageRoute(const LogView(), settings);

      default:
        return _getPageRoute(const SplashView(), settings);
    }
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
