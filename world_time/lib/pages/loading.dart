import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

//  String time = 'loading';

  void setWorldtime() async{
    WorldTime instance = WorldTime(url:'Asia/Kolkata',location: 'Kolkata',Flag: 'india.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'location':instance.location,
      'flag' : instance.Flag,
      'time':instance.Time,
      'isDay':instance.isDay,
    } );
//    setState(() {
//      time = instance.Time;
//    });
  }

   @override
  void initState() {
    super.initState();
    setWorldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
      );

  }
}
