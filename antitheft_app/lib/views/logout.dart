import 'package:antitheft_app/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 5)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          signOut();
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return Center(
            child: Image.network(
                "https://2critters.files.wordpress.com/2015/02/baymax.jpg"),
          );
        },
      ),
    );
  }
}

/*
            signOut();
            // call this to exit app
            //FlutterExitApp.exitApp();
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            */