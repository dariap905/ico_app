import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:store_redirect/store_redirect.dart';
import '../main.dart';

class Consultas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHomePage.buildAppBar(context),
      body: Center(
        child: CupertinoAlertDialog(
            title: Text("Redirección"),
            content: Text("Para poder hacer una consulta tienes que acceder a la app La Meva /Salut"),
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
      ),
    );
  }
}