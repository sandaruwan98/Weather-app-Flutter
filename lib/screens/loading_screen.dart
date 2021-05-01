import 'package:clima/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getcurrentLocation();
    // print(position);
  }

  void getData() async {
    Response res = await get(
        'api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=453');
    print(res.body);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
