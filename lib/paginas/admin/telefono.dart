import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class Telefono extends StatelessWidget {

  double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyHomePage.buildAppBar(context),
        body: Center(
            child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Table(
              border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                    children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                    ]),
                  ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Teléfono', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                            ]),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Fecha', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                            ]),
                      ),
                ]),
                TableRow( children: [
                  Text('Maria Garcia'),
                  Text('2432423434'),
                  Text('27-04-2020'),
                ]),
                TableRow( children: [
                  Text('Lina Marcela'),
                  Text('67867466'),
                  Text('10-04-2021'),
                ]),
              ],),
              ),
            ]),
          )
        );
  }
}
