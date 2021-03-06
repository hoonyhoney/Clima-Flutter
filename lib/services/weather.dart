import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey ='10a63e1ee0fc5ab2abec5b73e67a4a1d';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }


  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper =  NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;

  }




  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'π©';
    } else if (condition < 400) {
      return 'π§';
    } else if (condition < 600) {
      return 'βοΈ';
    } else if (condition < 700) {
      return 'βοΈ';
    } else if (condition < 800) {
      return 'π«';
    } else if (condition == 800) {
      return 'βοΈ';
    } else if (condition <= 804) {
      return 'βοΈ';
    } else {
      return 'π€·β';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'μμ΄μ€ν¬λ¦Ό λ¨Ήμ μκ°μ΄μμ π¦ ';
    } else if (temp > 20) {
      return 'λ°νμκ³  λ€λμΈμ! π';
    } else if (temp < 10) {
      return 'You\'ll need π§£ and π§€';
    } else {
      return 'Bring a π§₯ just in case';
    }
  }
}
