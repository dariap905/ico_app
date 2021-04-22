import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

import '../constants.dart';
import '../main.dart';

const String feature1 = 'feature1', //Perfil
    feature2 = 'feature2', // Boton tienda
    feature3 = 'feature3', // Equipo
    feature4 = 'feature4', // Medicacion
    feature5 = 'feature5', // Chat
    feature6 = 'feature6', // Citas
    feature7 = 'feature7', // Agenda
    feature8 = 'feature8'; // F.A.Q

const icon1 = Icon(Icons.person);
const icon2 = Icon(Icons.menu);
const icon3 = Icon(Icons.search);
const icon4 = Icon(Icons.add);

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
                      child: Text(
                        "Presiona los botones para saber lo que hacen.",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 1,
                            wordSpacing: 1,
                            backgroundColor: Colors.white54,
                        ),
                      )
                  ),
                  SizedBox(
                      width: double.infinity, // <-- match_parent
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text('App Store'),
                                content: Text('Presiona aquí para para ir a descargar la aplicación La Meva Salut'),
                              )
                          );
                        },
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
      child: FloatingActionButton(
        heroTag: null,
        mini: true,
        backgroundColor: kPrimaryLightColor,
        child: new Icon(Icons.person),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Tu perfil'),
                content: Text('Aquí puedes modificar tu información'),
              )
          );
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
  const Choice({this.title, this.icon, this.texto});

  final String title;
  final IconData icon;
  final String texto;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'Equipo', icon: Icons.bookmarks_outlined, texto: 'equipo'),
  const Choice(
      title: 'Medicación', icon: Icons.list_alt_outlined, texto: 'medicacion'),
  const Choice(title: 'Chat', icon: Icons.map_outlined, texto: 'consultas'),
  const Choice(title: 'Citas', icon: Icons.phone, texto: 'citas'),
  const Choice(title: 'Agenda', icon: Icons.menu_book_outlined, texto: 'agenda'),
  const Choice(title: 'F.A.Q', icon: Icons.book, texto: 'faq')
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: kPrimaryColor,
        child: InkWell(
            onTap: () {
              switch(choice.texto) {
                case 'equipo':
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Equipo ICO'),
                        content: Text('Aquí puedes consultar la lista de nuestro personal médico'),
                      )
                  );
                  break;
                case 'medicacion':
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Tu medicación'),
                        content: Text('Aquí puedes ver tu medicación y recetas'),
                      )
                  );
                  break;
                case 'consultas':
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Consultas'),
                        content: Text('Aquí puedes solicitar una consulta con alugien de nuestro equipo y ver la lista de consultas previas'),
                      )
                  );
                  break;
                case 'citas':
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Citas'),
                        content: Text('Aquí puedes ver todas tus citas pendientes'),
                      )
                  );
                  break;
                case 'agenda':
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Tu agenda'),
                        content: Text('Aquí puedes ver tus futuros eventos y añadir tus propios recordatorios, simplemente presiona el botón + '),
                      )
                  );
                  break;
                case 'faq':
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Preguntas más frecuentes'),
                        content: Text('Información sobre las enfermedades con las que trabajamos'),
                      )
                  );
                  break;
                default:
                // code block
              }},
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
