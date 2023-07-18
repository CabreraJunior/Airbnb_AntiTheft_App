import 'package:flutter/material.dart';

class DeviceWidget extends StatelessWidget {
  const DeviceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      tileColor: Color.fromARGB(255, 185, 207, 223),
      leading: Icon(
        Icons.tv,
        size: 30,
      ),
      title: Text(
        'TV',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      trailing: CircleAvatar(
        radius: 10,
        backgroundColor: Colors.green,
      ),
    );
  }
}
