import 'package:antitheft_app/utilities/constants.dart';
import 'package:antitheft_app/widgets/settings_card.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                    Text('Servicios',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 2),
                      child: Visibility(
                        visible: true,
                        child: Text(
                          'Escribenos con cualquier servicio que necesites',
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
            body: GridView(
              padding: const EdgeInsets.all(14),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.70,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              children: const [
                SettingsCard(
                  icon: Icons.house,
                  text: 'Evaluación',
                ),
                SettingsCard(
                  icon: Icons.signal_wifi_4_bar,
                  text: 'Conexión',
                ),
                SettingsCard(
                  icon: Icons.settings,
                  text: 'Configuración',
                ),
                SettingsCard(
                  icon: Icons.monetization_on,
                  text: 'Venta',
                ),
                SettingsCard(
                  icon: Icons.monitor,
                  text: 'Monitoreo',
                ),
                SettingsCard(
                  icon: Icons.design_services,
                  text: 'Diseño',
                ),
              ],
            )));
  }
}
