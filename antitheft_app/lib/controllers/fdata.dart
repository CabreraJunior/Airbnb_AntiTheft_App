import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FireData {
  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<List> getUserProperties() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    dynamic email = await storage.read(key: 'email');
    List properties = [];
    CollectionReference collectionReferenceProperties =
        database.collection("Properties");

    QuerySnapshot queryProperties = await collectionReferenceProperties
        .where("User", isEqualTo: email)
        .get();
    for (var element in queryProperties.docs) {
      properties.add(element.data());
    }

    getUser();

    return properties;
  }

  Future<List> getPropertyRooms(int id) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    dynamic email = await storage.read(key: 'token');
    List rooms = [];
    CollectionReference collectionReferenceProperties =
        database.collection("Rooms");

    QuerySnapshot queryRooms = await collectionReferenceProperties
        .where("User", isEqualTo: email)
        .where("Property", isEqualTo: id)
        .get();
    for (var element in queryRooms.docs) {
      rooms.add(element.data());
    }

    return rooms;
  }

  Future<List> getRoomDevices(int idRoom) async {
    List devices = [];
    CollectionReference collectionReferenceProperties =
        database.collection("Dispositivo");

    QuerySnapshot queryDevices = await collectionReferenceProperties
        .where("Room", isEqualTo: idRoom)
        .get();
    for (var element in queryDevices.docs) {
      devices.add(element.data());
    }

    return devices;
  }

  Future<List> getAllDevices() async {
    List devices = [];
    CollectionReference collectionReferenceProperties =
        database.collection("Dispositivo");

    QuerySnapshot queryDevices = await collectionReferenceProperties.get();
    for (var element in queryDevices.docs) {
      devices.add(element.data());
    }

    return devices;
  }

  Future<void> getUser() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    dynamic email = await storage.read(key: 'email');
    List users = [];
    CollectionReference collectionReferenceUsers = database.collection("Users");

    QuerySnapshot queryProperties =
        await collectionReferenceUsers.where("Email", isEqualTo: email).get();
    for (var element in queryProperties.docs) {
      users.add(element.data());
    }

    storage.write(key: "name", value: users[0]["Name"]);
  }
}
