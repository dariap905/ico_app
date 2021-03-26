import 'package:flutter/material.dart';
import 'package:ico_app/auth-screens/Welcome/welcome_screen.dart';

import '../constants.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _nombre;
  String _email;
  String _edad;
  String _telefono;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombre'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Se requiere un nombre';
        }

        return null;
      },
      onSaved: (String value) {
        _nombre = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Se requiere un correo electrónico';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Por favor, introduce un correo válido';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Edad'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty || value.length > 2) {
          return 'Introduce su edad';
        }

        return null;
      },
      onSaved: (String value) {
        _edad = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Teléfono'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Se requiere un numero de teléfono';
        }

        return null;
      },
      onSaved: (String value) {
        _telefono = value;
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
                _buildEmail(),
                _buildPassword(),
                _buildPhoneNumber(),
                SizedBox(height: 100),
                ElevatedButton(
                  child: Text(
                    'Guardar',
                    style: TextStyle(color: kPrimaryLightColor, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();
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
                Text("Email: " + _email),
                Text("Edad: " + _edad),
                Text("Teléfono: " + _telefono),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}