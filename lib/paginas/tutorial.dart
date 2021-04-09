import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../main.dart';

class CommonThings {
  static Size size;
}

class Tutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Scaffold(
            appBar: buildAppBar(context),
            body: Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.yellow
                    ],
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: double.infinity, // <-- match_parent
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        child: Text("Tutorial"),
                      )),
                  SizedBox(
                      width: double.infinity, // <-- match_parent
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("La Meva /Salut"),
                      )),
                  buildGridView(),
                ],
              ),
            )),
        buildFloatingActionButton(context),
      ],
    );
  }

  static buildFloatingActionButton(BuildContext context) {
    return Positioned(
      child: new FloatingActionButton(
        heroTag: null,
        mini: true,
        backgroundColor: kPrimaryLightColor,
        child: new Icon(Icons.person),
        onPressed: () {
        },
      ),
      right: 10.0,
      top: appBarHeight - 32.0,
    );
  }

  static buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("ICO App"),
    );
  }

  GridView buildGridView() {
    return GridView.count(
      // without shrinkWrap doesn't work because unbounded height restrictions
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: List.generate(choices.length, (index) {
          return Center(
            child: SelectCard(choice: choices[index]),
          );
        }));
  }
}

class Choice {
  const Choice({this.title, this.icon, this.ruta});

  final String title;
  final IconData icon;
  final String ruta;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'Equipo', icon: Icons.bookmarks_outlined, ruta: 'equipo'),
  const Choice(
      title: 'Medicación', icon: Icons.list_alt_outlined, ruta: 'medicacion'),
  const Choice(title: 'Chat', icon: Icons.map_outlined, ruta: 'consultas'),
  const Choice(title: 'Citas', icon: Icons.phone, ruta: 'citas'),
  const Choice(title: 'Agenda', icon: Icons.menu_book_outlined, ruta: 'agenda'),
  const Choice(title: 'F.A.Q', icon: Icons.book, ruta: 'faq')
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: kPrimaryColor,
        child: InkWell(
            onTap: () {},
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child:
                        Icon(choice.icon, size: 30.0, color: Colors.white)),
                    Text(
                      choice.title,
                      style: TextStyle(fontSize: 20),
                    ),
                  ]),
            )));
  }
}
