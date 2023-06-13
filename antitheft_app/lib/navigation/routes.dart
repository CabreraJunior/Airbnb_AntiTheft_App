import 'package:antitheft_app/views/home.dart';
import 'package:antitheft_app/views/login.dart';
import 'package:antitheft_app/views/register.dart';
import 'package:antitheft_app/views/restore.dart';
import 'package:antitheft_app/views/welcome.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case "/login":
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case "/register":
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case "/restore":
        return MaterialPageRoute(builder: (_) => const RestorePasswordScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text("ERROR"),
                    centerTitle: true,
                  ),
                  body: const Center(
                    child: Text('Page not found!'),
                  ),
                ));
    }
  }
}
