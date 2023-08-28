import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final items;
  final index;
  const NotificationTile({super.key, this.items, this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 48, 119, 119),
        child: Text("${index + 1}"),
      ),
      title: Text(items[0] ?? "Sensor Extra"),
      subtitle: Text(items[1]),
      trailing: const Icon(Icons.notification_important_outlined),
    );
    ;
  }
}
