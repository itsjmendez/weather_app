import 'package:flutter/material.dart';
import 'package:weatherapp/services/location.dart';
import 'package:http/http.dart' as http;
const apiKey = 'b0552d25ac0aa34d32167cef0e16ce0e';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    print(location.latitude);
    print(location.longitude);
  }

  void getData() async{
    http.Response response =  await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
     if (response.statusCode == 200){
       String data = response.body;
       print(data);
     }
     else{
      print(response.statusCode);
    }

  }
  
  
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
