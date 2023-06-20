import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data=data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;

    String bgImage=data['isDayTime'] ? 'day.png':'night.png';
    Color? bgColor=data['isDayTime']?Colors.blue:Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets2/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed: () async{
                        dynamic result =await Navigator.pushNamed(context, '/choose_location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'flag' : result['flag'],
                            'isDayTime':result['isDayTime']
                          };
                        });
                        print(result);
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                          'edit location',
                          style: TextStyle(
                            color: Colors.grey[300]
                          ),
                      ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          letterSpacing: 2
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                      data['time'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 66,
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
