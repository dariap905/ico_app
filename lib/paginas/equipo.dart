import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class Equipo extends StatelessWidget {
  double cardHeight = 80.0;
  static const double iconSize = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyHomePage.buildAppBar(context),
        body: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text("Haz clic sobre el nombre del colegiado para ver el detalle de sus datos."),
                  ),
                )
              ],
            ),
            Container(
                height: cardHeight,
                child: InkWell(
                  onTap: () {
                    print("Detalles equipo");
                  },
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading:
                              Icon(Icons.person_pin_rounded, size: iconSize),
                          title: Text('Marta Vaquero'),
                          subtitle: Text('Auxiliares de enfermería'),
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
                height: cardHeight,
                child: InkWell(
                  onTap: () {
                    print("Detalles equipo");
                  },
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading:
                              Icon(Icons.person_pin_rounded, size: iconSize),
                          title: Text('Natalia Suárez'),
                          subtitle: Text('Auxiliares de enfermería'),
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
                height: cardHeight,
                child: InkWell(
                  onTap: () {
                    print("Detalles equipo");
                  },
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading:
                              Icon(Icons.person_pin_rounded, size: iconSize),
                          title: Text('Mohamed Carbonero'),
                          subtitle: Text('Auxiliares de enfermería'),
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
                height: cardHeight,
                child: InkWell(
                  onTap: () {
                    print("Detalles equipo");
                  },
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading:
                              Icon(Icons.person_pin_rounded, size: iconSize),
                          title: Text('Arnau Bielsa'),
                          subtitle: Text('Auxiliares de enfermería'),
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
                height: cardHeight,
                child: InkWell(
                  onTap: () {
                    print("Detalles equipo");
                  },
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading:
                              Icon(Icons.person_pin_rounded, size: iconSize),
                          title: Text('India Romero'),
                          subtitle: Text('Auxiliares de enfermería'),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
