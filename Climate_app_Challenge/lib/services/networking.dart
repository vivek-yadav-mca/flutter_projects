import 'dart:convert';
import 'package:climate_app_challenge/utilities/constants.dart';
import 'package:http/http.dart' as http;

class Networking {
  String url;
  Networking({required this.url});

  Future getApiData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      dynamic decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
