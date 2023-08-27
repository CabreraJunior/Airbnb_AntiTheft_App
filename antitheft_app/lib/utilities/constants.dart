import 'package:flutter/material.dart';

class Constants {
  var appColor = Colors.blueGrey;
  //API CONSTANTS
  String serverUrl = "https://adlisting.herokuapp.com";
  //Auth Endpoints
  String registerEP = "/auth/register";
  String loginEP = "/auth/login";
  //Profile Endpoints
  String userReadEP = "/user/profile";
  String userUpdateEP = "/user/";
  //Ads Endpoints
  String adsEP = "/ads";
  String adsUserEP = "/ads/user";
  String adsUserUpdateDeleteEP = "/ads/";
  //Picture Endpoints
  String profilePictureEP = "/upload/profile";
  String photosEP = "/upload/photos";

  List<dynamic> notifications = [];
}
