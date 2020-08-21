import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/location.dart';
class Networking{
  Networking(this.url);

 final String url;
  Future getdata()async{
    //here get is a http function.not my on...so we mark in import http as http

    http.Response response=await http.get(url);
    if(response.statusCode==200){
      String data=response.body;
    //  var temp= jsonDecode(data)['main']['temp'];
    //  var weather=jsonDecode(data)['weather'][0]['id'];
    //  var city=jsonDecode(data)['name'];


    return jsonDecode(data);
    }
    else{
      print(response.statusCode);
    }

  }

}