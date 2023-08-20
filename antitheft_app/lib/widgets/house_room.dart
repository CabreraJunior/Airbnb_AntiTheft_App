import 'package:flutter/material.dart';

class HouseRoomWidget extends StatelessWidget {
  final String roomName;
  const HouseRoomWidget({super.key, required this.roomName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Image(
              color: Color.fromARGB(80, 0, 0, 0),
              colorBlendMode: BlendMode.darken,
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://cdn0.iconfinder.com/data/icons/interior-design-filled-outline/340/bedroom_room_interior_home_bed_furniture_lamp_house_pillows-1024.png",
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 10,
            child: Text(
              roomName,
              style: const TextStyle(
                  fontFamily: 'AirbnbCerealBold',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
