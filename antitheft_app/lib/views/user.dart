import 'package:antitheft_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

final TextEditingController _nameCtrl =
    TextEditingController(text: "Ana Martinez Delgago");
final TextEditingController _emailCtrl =
    TextEditingController(text: "anaconda@gmail.com");
final TextEditingController _passCtrl =
    TextEditingController(text: "xxxxxxxxx");

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 50,
        backgroundColor: Constants().appColor,
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text('Detalles de Usuario',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 2),
                child: Visibility(
                  visible: true,
                  child: Text(
                    'Observa y modifica tus datos',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 18),
            const CircleAvatar(
              //backgroundImage: AssetImage("assets/avatar.jpg"),
              radius: 60,
            ),
            const SizedBox(height: 8),
            Container(
              height: 400,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Material(
                      elevation: 10,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.black,
                      child: TextField(
                          enabled: false,
                          controller: _nameCtrl,
                          style: const TextStyle(fontSize: 18, height: 1),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none)),
                              prefixIcon: Icon(Icons.person))),
                    ),
                    const SizedBox(height: 22),
                    Material(
                      elevation: 10,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.black,
                      child: TextField(
                          enabled: false,
                          controller: _emailCtrl,
                          style: const TextStyle(fontSize: 18, height: 1),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none)),
                              prefixIcon: Icon(Icons.email))),
                    ),
                    const SizedBox(height: 22),
                    Material(
                      elevation: 10,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.black,
                      child: TextField(
                          enabled: false,
                          obscureText: true,
                          controller: _passCtrl,
                          style: const TextStyle(fontSize: 18, height: 1),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none)),
                              prefixIcon: Icon(Icons.fingerprint),
                              suffixIcon: IconButton(
                                  onPressed: (() {}),
                                  icon: Icon(Icons.remove_red_eye)))),
                    ),
                    const SizedBox(height: 34),
                    SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              // Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Constants().appColor,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text(
                              "Update Profile",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ))),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    ));
  }
}
