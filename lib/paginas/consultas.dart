import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Consultas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyApp.buildAppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}