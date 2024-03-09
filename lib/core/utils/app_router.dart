//Routes
import 'package:finder/features/dashboard/presentation/page/dashboard.dart';
import 'package:finder/features/login/presentation/page/login.dart';
import 'package:finder/features/post/presentation/page/post_screen.dart';
import 'package:finder/features/signup/presentation/page/signup.dart';
import 'package:finder/features/splash/presentation/page/splash_screen.dart';
import 'package:flutter/material.dart';

const splashRoute = '/splash';
const String loginRoute = '/login';
const String signupRoute = '/signup';
const String dashboardRoute = '/dashboard';
const String postRoute = '/post';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) =>  const Login());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case dashboardRoute:
        return MaterialPageRoute(builder: (_) => const DashBoard());
      case postRoute:
        return MaterialPageRoute(builder: (_) => const PostScreen());
      default:
        return MaterialPageRoute(builder: (_) =>  const Login());
    }
  }
}
