import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }
    void getLocation() async{
    Location location = Location();
    location.getCurrentLocation();
  }

    void getData() async {
    Response response = await get('http://api.openweathermap.org/data/2.5/');

    if (response.statusCode ==200) {
      String data =response.body;
    }else {
      print(response.statusCode);
    }

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
