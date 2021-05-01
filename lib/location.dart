import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double lng;

  Future<void> getcurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this.lat = position.latitude;
      this.lng = position.longitude;
    } on Exception catch (e) {
      this.lat = 0.0;
      this.lng = 0.0;
    }

    print("position");
    // print(position);
  }
}
