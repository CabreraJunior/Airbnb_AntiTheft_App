import 'package:antitheft_app/controllers/auth.dart';
import 'package:antitheft_app/views/mainscreen.dart';
import 'package:antitheft_app/views/welcome.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return MainNavigationScreen();
          } else {
            return const WelcomeScreen();
          }
        }));
  }
}
