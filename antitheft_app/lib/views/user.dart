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
                    'Observa tus datos',
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
            const SizedBox(height: 38),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://ychef.files.bbci.co.uk/1600x900/p0dnxrcv.webp"),
              radius: 100,
            ),
            const SizedBox(height: 50),
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
                    const SizedBox(height: 50),
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
