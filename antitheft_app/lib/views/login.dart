import 'package:antitheft_app/controllers/auth.dart';
import 'package:antitheft_app/utilities/alert_manager.dart';
import 'package:antitheft_app/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = "";
  bool isLogin = true;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  bool _isObscure = true;
  final Uri _url = Uri.parse(
      "https://docs.google.com/forms/d/143jVqzu3fhMl8BIrRUH4_WSxBHREvr1F94vF5qtAjrg/prefill?pli=1");

  Future<bool> signInWithEmailAndPassword() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailCtrl.text, password: _passwordCtrl.text);
      storage.write(key: "email", value: _emailCtrl.text);
      return true;
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
    return false;
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.width,
                    width: double.infinity,
                    child: Image.network(
                      "https://c0.wallpaperflare.com/preview/695/560/917/airbnb-%E5%8F%B0%E7%81%A3-%E8%87%BA%E5%8C%97-%E8%87%BA%E7%81%A3.jpg",
                      fit: BoxFit.cover,
                    )),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Container(
                      height: MediaQuery.of(context).size.width + 70,
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            const Text(
                              "Inicio de Sesión",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text("Inicia sesión con tu cuenta",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black)),
                            const SizedBox(height: 28),
                            Material(
                              elevation: 10,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              shadowColor: Colors.black,
                              child: TextField(
                                  controller: _emailCtrl,
                                  style: const TextStyle(fontSize: 18),
                                  decoration: const InputDecoration(
                                      labelText: "Correo Electrónico",
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.8),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none)))),
                            ),
                            const SizedBox(height: 20),
                            Material(
                              elevation: 10,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              shadowColor: Colors.black,
                              child: TextField(
                                  controller: _passwordCtrl,
                                  obscureText: _isObscure,
                                  style: const TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                    labelText: "Contraseña",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.8),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0, style: BorderStyle.none)),
                                    suffixIcon: IconButton(
                                        onPressed: (() {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        }),
                                        icon: Icon(_isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off)),
                                  )),
                            ),
                            const SizedBox(height: 32),
                            const SizedBox(height: 10),
                            SizedBox(
                                width: double.infinity,
                                child: RoundedLoadingButton(
                                    onPressed: () async {
                                      errorMessage == ""
                                          ? ""
                                          : "Humm ? $errorMessage";

                                      if (_emailCtrl.text.isEmpty ||
                                          _passwordCtrl.text.isEmpty) {
                                        AlertManager().displaySnackbar(context,
                                            "Por favor, complete todos los campos.");
                                      } else {
                                        if (await signInWithEmailAndPassword()) {
                                          Navigator.pushReplacementNamed(
                                              context, "/mainscreen");
                                        } else {
                                          AlertManager().displaySnackbar(
                                              context, errorMessage);
                                        }
                                      }
                                    },
                                    color: Constants().appColor,
                                    borderRadius: 20,
                                    controller: _btnController,
                                    resetDuration:
                                        const Duration(milliseconds: 3500),
                                    resetAfterDuration: true,
                                    errorColor: Constants().appColor,
                                    successColor: Constants().appColor,
                                    elevation: 16,
                                    height: 60,
                                    width: 400,
                                    child: const Text(
                                      "Inicio de Sesión",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ))),
                            const SizedBox(height: 4),
                            TextButton(
                                onPressed: () {
                                  _launchUrl();
                                },
                                child: Text(
                                  "No tienes cuenta? Solicítala",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Constants().appColor),
                                ))
                          ],
                        ),
                      )),
                ),
              ],
            )));
  }
}
