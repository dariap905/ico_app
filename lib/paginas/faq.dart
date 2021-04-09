import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHomePage.buildAppBar(context),
      body: Center(
        child: CupertinoAlertDialog(
          title: Text("Información sensible!"),
          content: Text("Preguntas y respuestas más frecuentes"),
          actions: <Widget>[
            TextButton(
              child: Text('Volver'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Proceder'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]
        ),
      ),
    );
  }
}