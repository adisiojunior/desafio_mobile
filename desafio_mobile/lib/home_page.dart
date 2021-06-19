import 'package:desafio_mobile/services/authservice.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('Você está logado em'),
        ElevatedButton(
          onPressed: () {
            AuthService().singOut();
          }, child: Center(
            child:
             Text('Sair'),
          )
        )
      ]
      )
    );
  }
}