import 'package:geolocator/geolocator.dart';
class  Location {
  double latitute;
  double longituute;
 Future<void>  getmylocation()async{
    try{
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);



      latitute=position.latitude;
      longituute=position.longitude;

    }
    catch(e){
      print(e);
    }

  }


}