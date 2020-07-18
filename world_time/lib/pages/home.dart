import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
//    print(data);

    String bgImage = data['isDay'] ? 'day.png' : 'night.png' ;
    Color bgColor = data['isDay'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                   dynamic result = await Navigator.pushNamed(context,'/location');
                   setState(() {
                     data = {
                       'time' : result['time'],
                       'location': result['location'],
                       'isDay':result['isDay'],
                       'flag':result['flag'],
                     };
                   });

                  },
                  label: Text(
                      "Edit Location",
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                      ),
                  ),
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[200],
                    size: 40.0,
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      data['location'] ,
                      style: TextStyle(
                         fontSize: 30.0,
                        color:Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 10.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 67.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
