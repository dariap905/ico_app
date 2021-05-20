import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

import '../main.dart';

class Medicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHomePage.buildAppBar(context),
      body: CupertinoAlertDialog(
          title: Text("Redirección"),
          content: Text("Para poder ver tu medación tienes que acceder a la app La Meva /Salut"),
          actions: <Widget>[
            TextButton(
              child: Text('Abrir'),
              onPressed: () {
                StoreRedirect.redirect(androidAppId: "cat.gencat.mobi.lamevasalut", iOSAppId: "1358288989");
              },
            ),
            TextButton(
              child: Text('Volver'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]
      ),
    );
  }
}