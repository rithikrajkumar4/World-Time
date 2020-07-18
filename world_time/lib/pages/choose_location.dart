import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Choose_Location extends StatefulWidget {
  @override
  _Choose_LocationState createState() => _Choose_LocationState();
}

class _Choose_LocationState extends State<Choose_Location> {

  List<WorldTime> locations = [

    WorldTime(url:'Europe/London',Flag:'uk.png',location: 'London'),
    WorldTime(url: 'Europe/Berlin',location: 'Athens',Flag:'greece.png'),
    WorldTime(url:'Africa/Cairo',location: 'Cairo',Flag: 'egypt.png'),
    WorldTime(url:'Africa/Nairobi',location: 'Nairobi',Flag: 'kenya.png'),
    WorldTime(url:'Asia/Kolkata',location: 'Kolkata',Flag: 'india.png'),
    WorldTime(url:'America/Chicago',location: 'Chicago',Flag:'usa.png' ),
    WorldTime(url:'America/New_York',location: 'New York',Flag: 'usa.png'),
    WorldTime(url:'Asia/Seoul',location: 'Seoul',Flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta',location: 'Jakarta',Flag:'indonesia.png'),

  ];

  void updateTime(index) async {

    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag' : instance.Flag,
      'time':instance.Time,
      'isDay':instance.isDay,
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0 , horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].Flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
