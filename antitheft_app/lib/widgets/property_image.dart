import 'package:flutter/material.dart';

class PropertyImageCard extends StatelessWidget {
  const PropertyImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 165,
      child: Stack(
        fit: StackFit.expand,
        children: const <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Image(
              color: Color.fromARGB(80, 0, 0, 0),
              colorBlendMode: BlendMode.darken,
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://www.thehousedesigners.com/images/plans/URD/bulk/6583/the-destination-front-rendering.jpg",
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 10,
            child: Text(
              "Propiedad 1 - Cienfuegos",
              style: TextStyle(
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
