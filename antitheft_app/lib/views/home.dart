import 'package:antitheft_app/utilities/constants.dart';
import 'package:antitheft_app/widgets/property_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 50,
              backgroundColor: Constants().appColor,
              toolbarHeight: 100,
              centerTitle: true,
              leadingWidth: 75,
              leading: const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://ychef.files.bbci.co.uk/1600x900/p0dnxrcv.webp"),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text('Bienvenida Ana',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Visibility(
                        visible: true,
                        child: Text(
                          'Elija la propiedad que desea monitorear',
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
            body: ListView.separated(
                padding: const EdgeInsets.all(12),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    child: const PropertyImageCard(),
                    onTap: () {
                      Navigator.pushNamed(context, "/property");
                    },
                  );
                }),
                separatorBuilder: ((context, index) {
                  return const SizedBox(
                    height: 24,
                  );
                }),
                itemCount: 10)));
  }
}
