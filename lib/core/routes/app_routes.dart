import 'package:exams_system/core/routes/route_names.dart';
import 'package:exams_system/core/routes/routes_arguments.dart';
import 'package:exams_system/presentation/screens/forgot_password_screen.dart';
import 'package:exams_system/presentation/screens/home_screen.dart';
import 'package:exams_system/presentation/screens/set_exam.dart';
import 'package:exams_system/presentation/screens/sign_in_screen.dart';
import 'package:exams_system/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen());
      case Routes.setExamRoute:
        SetExamArgs setExamArgs = routeSettings.arguments as SetExamArgs;
        return MaterialPageRoute(
            builder: (context) => SetExamScreen(examId: setExamArgs.id));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                child: Text(
                  RoutesStrings.noRouteFound,
                  style: TextStyle(color: Colors.pink),
                ),
              ),
            ));
  }
}
