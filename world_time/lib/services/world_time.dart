import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location of the ui
  String Time ;//time at that location
  String Flag ; // flag of the location
  String url ; // url of the location
  bool isDay; // to get date and night

  WorldTime({this.location,this.Flag , this.url});


  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
//  print(data);

      // Get Properties
      String dateTime = data['datetime'];
      String offset_hour = data['utc_offset'].substring(1,3);
      String offset_min = data['utc_offset'].substring(4,6);

//  print(dateTime);
//  print(offset_hour);
//  print(offset_min);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours:int.parse(offset_hour) , minutes: int.parse(offset_min)));

      //set time
      isDay = (now.hour > 6 && now.hour < 20 )? true : false;
      Time = DateFormat.jm().format(now);

    }
    catch(e)
    {
      print('Caught Erroe : $e');
      Time = 'Could Not Get Time';
    }



  }

}
