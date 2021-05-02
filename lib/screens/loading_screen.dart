import 'dart:convert';

import 'package:clima/location.dart';
import 'package:clima/services/networking.dart';
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

  void getLocationandData() async {
    Location location = Location();
    await location.getcurrentLocation();

    lat = location.lat;
    lng = location.lng;

    NetworkHelper network = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&appid=$ApiKey');
    var weatherdata = await network.getData();
  }

  @override
  void initState() {
    super.initState();
    getLocationandData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
