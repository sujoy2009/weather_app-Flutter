import 'package:clima/screens/location_screen.dart';


import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {






  void getlocationdata()async{
    WeatherModel weatherModel=WeatherModel();
   var weatherdata= await weatherModel.getlocationweatherr();



 //   print(weatherdata['name']);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen( locationweather: weatherdata ,);
    }));


  }




  @override
  void initState() {

    super.initState();
    getlocationdata();

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color:Colors.white,
          size: 100.0,
        ),
      ),


    );
  }
}
