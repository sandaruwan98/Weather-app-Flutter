import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationandData() async {
    var weatherdata = await WeatherModel().getWeatherData();

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
