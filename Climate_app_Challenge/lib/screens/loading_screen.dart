import 'dart:convert';
import 'package:climate_app_challenge/screens/location_screen.dart';
import 'package:climate_app_challenge/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:climate_app_challenge/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:climate_app_challenge/utilities/constants.dart';
import 'package:climate_app_challenge/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    dynamic weatherData = await weatherModel.getLocationData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherdata: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitSpinningCircle(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}
