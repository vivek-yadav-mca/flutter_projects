import 'package:climate_app_challenge/services/location.dart';
import 'package:climate_app_challenge/utilities/constants.dart';
import 'package:climate_app_challenge/services/networking.dart';

class WeatherModel {
  Future<dynamic> getCityData(String ciytName) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=${ciytName}&appid=${Constants.apiKey}&units=metric';
    Networking networking = Networking(url: url);
    dynamic weatherData = await networking.getApiData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=${Constants.apiKey}&units=metric';
    Networking networking = Networking(url: url);
    dynamic weatherData = await networking.getApiData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
