import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String email, password;

  Color greenColor = Color(0xFF00AF19);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
            key: formKey,
            child: _buildLoginForm(),
      )
      )
    );
  }
  _buildLoginForm() {
    return Padding (
      padding: const EdgeInsets.only(left: 25.0, right:25.0),
      child: ListView(
        children: [
          SizedBox(height: 75.0),
          Container(
            height: 125.0,
            width:200.0,
            child: Stack(
              children: [
                Text('Tela de',
                style: TextStyle(
                  fontFamily: 'Truneo',
                  fontSize: 60.0
                )
                ),
                Positioned(
                  top: 50.0,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Truneo',
                      fontSize: 60.0
                    )
                  )
                ),
                Positioned(
                  top: 97.0,
                  left: 175.0,
                  child: Container(
                    height: 10.0,
                    width: 10.0,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: greenColor
                    ),
                  )
                )
              ],
            )
          )
        ],
      )
      );
  }
}