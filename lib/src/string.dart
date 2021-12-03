import 'package:flutter/material.dart';

class Strings {
  static const String contactUrl =
      'https://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts';

  static const String noInternet = 'No Internet connection';
  static const String noData = "No data Available";
  static const String dataException =
      'Error occured while Communication with Server with StatusCode :';
  static const String unknownError = "Something Went Wrong";
  static const String loading = "Loading";
  static const String title = "Watchlist";
  static const String appTitle = "Flutter";
  static const String darkmode = "Dark Mode";
  static const String lightmode = "Light Mode";
  static const String defalutmode = "System Defalut";

  static const List<Tab> name = <Tab>[
    Tab(
        child: (Text(
      "Contact 1",
      style: TextStyle(fontSize: 14, color: Colors.white),
    ))),
    Tab(
        child: (Text(
      "Contact 2",
      style: TextStyle(fontSize: 14, color: Colors.white),
    ))),
    Tab(
        child: (Text(
      "Contact 3",
      style: TextStyle(fontSize: 14, color: Colors.white),
    ))),
    Tab(
        child: (Text(
      "Contact 4",
      style: TextStyle(fontSize: 14, color: Colors.white),
    ))),
  ];
}
