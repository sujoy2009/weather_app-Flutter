import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationweather});
  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel waathermodell=WeatherModel();
  int temperatureis;
  String conditionicon;
  String cityyy;
  String wethermasg;

  @override
  void initState() {

    super.initState();
    //widget is used to pass data from first to second class here
    updateUi(widget.locationweather);
  }
  void updateUi( dynamic weatherdata){
    setState(() {
      if(weatherdata==null){
        temperatureis=0 ;
        conditionicon='error';
        wethermasg='unable to connect ';
        cityyy='';
        return;
        //return break this function updateui
      }
      double  temp= weatherdata['main']['temp'];
      temperatureis=temp.toInt();
      var condition=weatherdata['weather'][0]['id'];
      conditionicon=waathermodell.getWeatherIcon(condition);

      cityyy=weatherdata['name'];
      wethermasg=waathermodell.getMessage(temperatureis);
      //print(temperatureis);


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
                  FlatButton(
                    onPressed: ()async {
                      var weatherrdata= await waathermodell.getlocationweatherr();
                       updateUi(weatherrdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                    var pop_citymame=await  Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();


                      },
                      ),
                    );
                    if(pop_citymame!=null){
                    var cityweather=await  waathermodell.getspecificcityweather(pop_citymame);
                     updateUi(cityweather);
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
                      '$temperatureis',
                      style: kTempTextStyle,
                    ),
                    Text(
                      conditionicon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$wethermasg in $cityyy!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
