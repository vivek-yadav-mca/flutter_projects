import 'package:climate_app_challenge/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:climate_app_challenge/utilities/constants.dart';
import 'package:climate_app_challenge/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LocationScreen extends StatefulWidget {
  final dynamic weatherdata;
  LocationScreen({super.key, required this.weatherdata});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late int condition;
  late String cityName;
  late String weatherIcon;
  late String weatherMsg;
  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherdata);
  }

  void updateUI(dynamic weatherdata) {
    setState(() {
      if (weatherdata == null) {
        temperature = 0;
        weatherIcon = 'Error';
        cityName = 'current location';
        weatherMsg = 'unable to fetch data';
      }
      condition = weatherdata['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      double temp = weatherdata['main']['temp'];
      temperature = temp.toInt();
      weatherMsg = weatherModel.getMessage(temperature);
      cityName = weatherdata['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      dynamic weatherdata =
                          await WeatherModel().getLocationData();
                      updateUI(weatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      String userCity = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (userCity != null) {
                        dynamic weatherData =
                            await weatherModel.getCityData(userCity);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: Constants.kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: Constants.kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMsg in $cityName',
                  textAlign: TextAlign.right,
                  style: Constants.kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
