import 'package:antitheft_app/utilities/constants.dart';
import 'package:antitheft_app/widgets/device_widget.dart';
import 'package:flutter/material.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 50,
              backgroundColor: Constants().appColor,
              toolbarHeight: 100,
              leadingWidth: 40,
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text('Habitacion 1',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Visibility(
                        visible: true,
                        child: Text(
                          'Propiedad 1 - Cienfuegos',
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
            body: GridView.builder(
                padding: EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 30),
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return const DeviceWidget();
                }))));
  }
}
