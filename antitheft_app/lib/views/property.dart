import 'package:antitheft_app/controllers/fdata.dart';
import 'package:antitheft_app/utilities/constants.dart';
import 'package:antitheft_app/widgets/house_room.dart';
import 'package:flutter/material.dart';

class PropertyScreen extends StatelessWidget {
  final dynamic data;
  const PropertyScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    String propertyName = data[0];
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
              Text(propertyName,
                  style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Visibility(
                  visible: true,
                  child: Text(
                    'Propiedad $index',
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
        future: FireData().getPropertyRooms(id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List rooms = snapshot.data;
            return GridView.builder(
                padding: const EdgeInsets.all(12.0),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.70,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: rooms.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    child: HouseRoomWidget(
                      roomName: rooms[index]["Name"],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/devices", arguments: [
                        rooms[index]["Name"],
                        index + 1,
                        rooms[index]["Id"]
                      ]);
                    },
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
