import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Diagnosticos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHomePage.buildAppBar(context),
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