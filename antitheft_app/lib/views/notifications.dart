import 'package:antitheft_app/controllers/fdata.dart';
import 'package:antitheft_app/utilities/constants.dart';
import 'package:antitheft_app/widgets/notification_tile.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
      body: FutureBuilder(
        future: FireData().getNotifications(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List output = snapshot.data;
            List notis = List.from(output.reversed);
            return ListView.builder(
              itemCount: notis.length,
              itemBuilder: (context, index) {
                return NotificationTile(
                  items: [notis[index]["Title"], notis[index]["Description"]],
                  index: index,
                );
              },
            );
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
