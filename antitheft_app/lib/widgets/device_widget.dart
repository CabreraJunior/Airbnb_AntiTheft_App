import 'package:flutter/material.dart';

class DeviceWidget extends StatelessWidget {
  final String deviceName;
  final bool status;
  final IconData newIcon;
  const DeviceWidget(
      {super.key,
      required this.deviceName,
      required this.status,
      required this.newIcon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      tileColor: Colors.blueGrey.shade100,
      leading: Icon(
        newIcon,
        size: 30,
        color: Colors.black,
      ),
      title: Text(
        deviceName,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey.shade900),
      ),
      trailing: CircleAvatar(
        radius: 14,
        backgroundColor: status ? Colors.green : Colors.red,
      ),
    );
  }
}
