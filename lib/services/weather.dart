import 'dart:ffi';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'YOUR API KEY';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Uri url = await Uri.parse(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Uri url = await Uri.parse(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 35) {
      return 'It\'s 🍦 time';
    } else if (temp > 30) {
      return 'Time for shorts and 👕';
    } else if (temp < 25) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
