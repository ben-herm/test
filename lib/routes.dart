import 'package:flutter/material.dart';

import 'ui/home/home.dart';
import 'ui/login/login.dart';
import 'ui/register/register.dart';
import 'ui/splash/splash.dart';
import 'ui/register/emailConfirmation.dart';
import 'ui/onboarding/onboarding.dart';
import 'ui/register/questionnaire/questionnaire.dart';

class Routes {
  Routes._();

  //general routes
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String home = '/home';

  //register routes
  static const String register = '/register';
  static const String emailConfirmation = '/emailConfirmation';
  static const String questionnaire = '/questionnaire';

  //login routes
  static const String login = '/login';

  // Route _createRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) =>,
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       var begin = Offset(0.0, 1.0);
  //       var end = Offset.zero;
  //       var curve = Curves.ease;

  //       var tween =
  //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  //       return SlideTransition(
  //         position: animation.drive(tween),
  //         child: child,
  //       );
  //     },
  //   );
  // }

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    register: (BuildContext context) => RegisterScreen(),
    emailConfirmation: (BuildContext context) => EmailConfirmation(),
    login: (BuildContext context) => LoginScreen(),
    questionnaire: (BuildContext context) => QuestionnaireScreen(),
    onboarding: (BuildContext context) => Onboarding(),
    home: (BuildContext context) => HomeScreen(),
  };
}
