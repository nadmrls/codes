import 'package:flutter/material.dart';
import 'package:personal_company/dashboard/screens/home_screens/main_screen.dart';
import 'package:personal_company/dashboard/screens/initial_screen.dart';
import 'package:personal_company/dashboard/screens/login_screen.dart';
import 'package:personal_company/dashboard/screens/signup_screen.dart';

// Define all the routes here
class AppRoutes {
  static const String initialScreen = '/';
  static const String login_screen = '/login_screen';
  static const String signup_screen = '/signup_screen';
  static const String dashboard = '/dashboard';

  // Define a method to get the route
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      initialScreen: (context) => const InitialScreen(),
      login_screen: (context) => const LoginScreen(),
      signup_screen: (context) => const SignupScreen(),
      dashboard: (context) => Dashboard(),
    };
  }
}
