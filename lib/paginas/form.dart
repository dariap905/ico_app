import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ico_app/auth-screens/Login/login_screen.dart';
import 'package:ico_app/auth-screens/Welcome/welcome_screen.dart';
import 'package:ico_app/services/database.dart';

import '../constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
   String _nombre = "";
   String _apellidos = "";
   String _cip = "";
   String _dni = "";
   String _fechaNacim = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final User user = _auth.currentUser!;

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombre'),
      maxLength: 10,
      validator: (String ? value) {
        if (value!.isEmpty) {
          return 'Se requiere un nombre';
        }

        return null;
      },
      onSaved: (String ? value) {
        _nombre = value!;
      },
    );
  }

   Widget _buildLastName() {
     return TextFormField(
       decoration: InputDecoration(labelText: 'Apellidos'),
       maxLength: 10,
       validator: (String ? value) {
         if (value!.isEmpty) {
           return 'Se requiere minimo un apellido';
         }

         return null;
       },
       onSaved: (String ? value) {
         _apellidos = value!;
       },
     );
   }

   Widget _buildCip() {
     return TextFormField(
       decoration: InputDecoration(labelText: 'CIP'),
       maxLength: 10,
       validator: (String ? value) {
         if (value!.isEmpty) {
           return 'Se requiere un CIP';
         }

         return null;
       },
       onSaved: (String ? value) {
         _cip = value!;
       },
     );
   }

  Widget _buildDni() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'DNI'),
      validator: (String ? value) {
        if (value!.isEmpty) {
          return 'Se requiere un dni';
        }

        return null;
      },
      onSaved: (String ? value) {
        _dni = value!;
      },
    );
  }

   Widget _buildFechaNacim() {
     return TextFormField(
       decoration: InputDecoration(labelText: 'Fecha de nacimiento'),
       keyboardType: TextInputType.datetime,
       validator: (String ? value) {
         if (value!.isEmpty) {
           return 'Se requiere una fecha';
         }

         return null;
       },
       onSaved: (String ? value) {
         _fechaNacim = value!;
       },
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Datos personales")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildLastName(),
                _buildCip(),
                _buildDni(),
                _buildFechaNacim(),
                SizedBox(height: 100),
                ElevatedButton(
                  child: Text(
                    'Guardar',
                    style: TextStyle(color: kPrimaryLightColor, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    _formKey.currentState!.save();
                    _showMyDialog();

                    //Send to API
                  },
                ),
                ElevatedButton(
                  child: Text(
                    'Siguiente',
                    style: TextStyle(color: kPrimaryLightColor, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomeScreen();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Comprueba los datos'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Nombre: " + _nombre),
                Text("Apellidos: " + _apellidos),
                Text("CIP: " + _cip),
                Text("DNI: " + _dni),
                Text("Fecha de nacimiento: " + _fechaNacim),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () async{
                await DatabaseService(uid: user.uid).updateUserData(_nombre, _apellidos, _cip, _dni, _fechaNacim);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}