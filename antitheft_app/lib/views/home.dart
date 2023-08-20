import 'package:antitheft_app/controllers/auth.dart';
import 'package:antitheft_app/controllers/fdata.dart';
import 'package:antitheft_app/utilities/constants.dart';
import 'package:antitheft_app/widgets/property_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

dynamic name = "Usuario";

Future<void> getName() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  name = await storage.read(key: 'name');
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    getName();
    return SafeArea(
      child: FutureBuilder(
        future: Auth().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            //User user = snapshot.data;
            return Scaffold(
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
                    children: <Widget>[
                      Text("Bienvenido $name",
                          style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      const Padding(
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
              body: FutureBuilder(
                future: FireData().getUserProperties(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List properties = snapshot.data;
                    return ListView.separated(
                        padding: const EdgeInsets.all(12),
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            child: PropertyImageCard(
                              propertyName:
                                  "${index + 1} - " + properties[index]["Name"],
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/property",
                                  arguments: [
                                    properties[index]["Name"],
                                    index + 1,
                                    properties[index]["Id"]
                                  ]);
                            },
                          );
                        }),
                        separatorBuilder: ((context, index) {
                          return const SizedBox(
                            height: 24,
                          );
                        }),
                        itemCount: properties.length);
                  } else {}
                  return Center(
                    child: CircularProgressIndicator(
                      color: Constants().appColor,
                    ),
                  );
                },
              ),
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
    );
  }
}
