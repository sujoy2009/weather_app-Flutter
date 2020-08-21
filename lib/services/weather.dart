
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
const apikey='90ad56f5667dc6e73eb2ea91bf6fd5ad';
const openapiurl='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getspecificcityweather(String cityname)async{
    var url='$openapiurl?q=$cityname&appid=$apikey&units=metric';
    Networking networking=Networking(url);
   var cityweather= await networking.getdata();
   return cityweather;
  }

  Future<dynamic> getlocationweatherr()async{
    print('klk');
  Location location=Location();
  await  location.getmylocation();
  double latitute;

  double longitude;

  latitute= location.latitute;
  longitude=location.longituute;
  Networking networking=Networking('https://api.openweathermap.org/data/2.5/weather?lat=$latitute&lon=$longitude&appid=$apikey&units=metric');
  var weatherdata=  await networking.getdata();
  return weatherdata;
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
