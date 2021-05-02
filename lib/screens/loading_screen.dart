import 'dart:convert';

import 'package:clima/location.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const ApiKey = '7b2f6b9601490c6ba0a581c4064effea';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationandData() async {
    Location location = Location();
    await location.getcurrentLocation();

    NetworkHelper network = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.lng}&appid=$ApiKey&units=metric');
    var weatherdata = await network.getData();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationScreen(weatherdata)));
  }

  @override
  void initState() {
    super.initState();
    getLocationandData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
