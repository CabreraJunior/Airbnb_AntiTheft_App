import 'package:antitheft_app/utilities/constants.dart';
import 'package:antitheft_app/widgets/notification_tile.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<String> items = List<String>.generate(100, (i) => '$i');

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
                    Text('Notificaciones',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 2),
                      child: Visibility(
                        visible: true,
                        child: Text(
                          'Mantente al tanto de tus propiedades',
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
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return NotificationTile(
                  items: items,
                  index: index,
                );
              },
            )));
  }
}
