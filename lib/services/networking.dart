import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    Response res = await get(url);
    if (res.statusCode == 200) {
      String data = res.body;
      var jsondata = jsonDecode(data);
      return jsondata;
    }
  }
}
