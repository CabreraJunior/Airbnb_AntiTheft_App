import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final items;
  final index;
  const NotificationTile({super.key, this.items, this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 48, 119, 119),
        child: Text(items[index + 1]),
      ),
      title: Text('Titulo Notificacion ${items[index + 1]}'),
      subtitle: Text('Descripcion'),
      trailing: Icon(Icons.more_vert),
    );
    ;
  }
}
