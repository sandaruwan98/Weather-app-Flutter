import 'dart:convert';

import 'package:clima/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

const ApiKey = '7b2f6b9601490c6ba0a581c4064effea';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double lng;

  void getLocation() async {
    Location location = Location();
    await location.getcurrentLocation();

    lat = location.lat;
    lng = location.lng;
    getData();
    // print(position);
  }

  void getData() async {
    Response res = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&appid=$ApiKey');
    if (res.statusCode == 200) {
      String data = res.body;
      var jsondata = jsonDecode(data);
      double temperature = jsondata['main']['temp'];
      int condition = jsondata['weather'][0]['id'];
      String city = jsondata['name'];
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
