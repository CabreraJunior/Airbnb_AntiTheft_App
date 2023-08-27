import 'package:antitheft_app/controllers/fdata.dart';
import 'package:antitheft_app/utilities/constants.dart';
import 'package:antitheft_app/widgets/device_widget.dart';
import 'package:flutter/material.dart';

class DeviceScreen extends StatelessWidget {
  final dynamic data;
  const DeviceScreen({super.key, this.data});

  bool getStatus(String name, double value) {
    bool out = true;
    if (name == "Televisión") {
      if (value <= 0.7) {
        out = false;
      }
    } else if (name == "Decibeles") {
      if (value >= 70) {
        out = false;
      }
    } else if (name == "Humo") {
      if (value >= 1000000) {
        out = false;
      }
    }
    return out;
  }

  IconData getIcon(String name) {
    IconData out = Icons.device_hub;
    if (name == "Televisión") {
      out = Icons.live_tv_rounded;
    } else if (name == "Decibeles") {
      out = Icons.music_note;
    } else if (name == "Humo") {
      out = Icons.smoking_rooms_outlined;
    }
    return out;
  }

  @override
  Widget build(BuildContext context) {
    String roomName = data[0];
    int index = data[1];
    int id = data[2];
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
            children: <Widget>[
              Text(roomName,
                  style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Visibility(
                  visible: true,
                  child: Text(
                    'Habitacion $index',
                    style: const TextStyle(
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
      body: FutureBuilder(
        future: FireData().getRoomDevices(id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List devices = snapshot.data;
            return GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500,
                    childAspectRatio: 6.2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 30),
                itemCount: devices.length,
                itemBuilder: ((context, index) {
                  return DeviceWidget(
                    deviceName: devices[index]["Name"],
                    status: getStatus(
                        devices[index]["Name"], devices[index]["Data"]),
                    newIcon: getIcon(devices[index]["Name"]),
                  );
                }));
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Constants().appColor,
              ),
            );
          }
        },
      ),
    ));
  }
}
