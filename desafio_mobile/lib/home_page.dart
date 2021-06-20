import 'package:desafio_mobile/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Agora vou criar uma variável que conterá as coordenadas de localização
  var locationMessage = '';

  // criar uma função que obterá a localização atual
  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator().getLastKnownPosition();
    
    var Lat = position.latitude;
    var Long = position.longitude;
    
    setState(() {
          locationMessage = 'Latitude : $Lat, Longitude : $Long';
        });
  }

  Color greenColor = Color(0xFF00AF19);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sua Localização',
                style: TextStyle(
                  fontFamily: 'Trueno',
                  fontSize: 60.0
                )
          ),
          
        Column(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.location_on,
                  size: 45.0,
                  color: greenColor,
                  ),
                  SizedBox(
                    height: 10.0
                  ),
                  Text(
                    'Sua Localização',
                     style: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 26.0,
                    )
                  ),
                  SizedBox(
                    height: 20.0
                  ),
                  
                  Text("Localização :\n $locationMessage",
                      style: TextStyle(
                        fontFamily: 'Trueno',
                        fontSize: 15.0,
                      )),
                  FlatButton(
                    onPressed: () {
                      getCurrentLocation();
                    },
                    color: greenColor,
                    child: Text('Sua localização, AQUI',
                    style: TextStyle(
                      fontFamily: 'Trueno',
                      color: Colors.white
                    ),),
                  )
                ],
            ),
          ],
        ),

        SizedBox(height: 100.0),
        GestureDetector(
            onTap: () {
               AuthService().singOut(); 
            },
            child: Container(
              height: 50.0,
              width: 70.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.greenAccent,
                color: greenColor,
                elevation: 7.0,
            child: Center(
                child:
                  Text('Sair',
                    style: TextStyle(
                    color: Colors.white, fontFamily: 'Trueno'
                    ),
                ),
              )
            )
          )
        )
        ]  
      )
    );
  }
}