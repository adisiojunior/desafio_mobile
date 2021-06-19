import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String email, password;

  Color greenColor = Color(0xFF00AF19);

  // Para verificar o campos durante os envios
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // trecho para validação de email
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

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
                  fontFamily: 'Trueno',
                  fontSize: 60.0
                )
                ),
                Positioned(
                  top: 50.0,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Trueno',
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
          ),
          SizedBox(height: 25.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'EMAIL',
              labelStyle: TextStyle(
                fontFamily: 'Trueno',
                fontSize:12.0,
                color: Colors.grey.withOpacity(0.5)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greenColor),
                
                )
            ),
            onChanged: (value) {
                  this.email = value;
                },
              validator: (value) => 
                  value.isEmpty ? 'Email requerido':validateEmail(value)),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'PASSWORD',
              labelStyle: TextStyle(
                fontFamily: 'Trueno',
                fontSize:12.0,
                color: Colors.grey.withOpacity(0.5)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greenColor),
                
                )),
            obscureText: true,    
            onChanged: (value) {
                  this.password = value;
                },
              validator: (value) => 
                  value.isEmpty ? 'Senha requerido':null,
          )    
        ],
      )
      );
  }
}