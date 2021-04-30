import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class FAQ extends StatelessWidget {

  _launchURL() async {
    const url = 'https://es.wikipedia.org/wiki/C%C3%A1ncer';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
              onPressed: _launchURL,
            ),
          ]
        ),
      ),
    );
  }
}