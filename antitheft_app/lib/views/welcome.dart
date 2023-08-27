import 'package:antitheft_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Container(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    height: MediaQuery.of(context).size.width + 70,
                    width: double.infinity,
                    //color: Colors.green,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        "https://c0.wallpaperflare.com/preview/695/560/917/airbnb-%E5%8F%B0%E7%81%A3-%E8%87%BA%E5%8C%97-%E8%87%BA%E7%81%A3.jpg",
                        fit: BoxFit.cover,
                      ),
                    )),
                const SizedBox(height: 50),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        "Monitorea tu Hogar",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Controla con Confianza. Monitorea con Éxito \n Tu Solución de Gestión en Airbnb",
                        style: TextStyle(fontSize: 18, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              height: 50,
                              width: 160,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, "/login");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Constants().appColor,
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text("Iniciar Sesión",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
