import 'package:flutter/material.dart';
import 'package:ico_app/paginas/agenda.dart';
import 'package:ico_app/paginas/cita-previa.dart';
import 'package:ico_app/paginas/consultas.dart';
import 'package:ico_app/paginas/diagnosticos.dart';
import 'package:ico_app/paginas/informes.dart';
import 'package:ico_app/paginas/medicacion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: buildAppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buildGridView(),
            ],
          )),
      initialRoute: '/',
      routes: getRutas(),
      onGenerateRoute: ( RouteSettings settings ){
        return MaterialPageRoute(
            builder: ( BuildContext context ) => MyApp(),
        );
      },
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

  static buildAppBar() {
    return AppBar(
      title: Text("ICO App"),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.attribution_outlined,
                size: 30.0,
              ),
            )),
      ],
    );
  }
}

class Choice {
  const Choice({this.title, this.icon, this.ruta});

  final String title;
  final IconData icon;
  final String ruta;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Informes', icon: Icons.bookmarks_outlined, ruta: 'informes'),
  const Choice(title: 'Medicación', icon: Icons.list_alt_outlined, ruta: 'medicacion'),
  const Choice(title: 'Consultas', icon: Icons.map_outlined, ruta: 'consultas'),
  const Choice(title: 'Cita previa', icon: Icons.phone, ruta: 'citaprevia'),
  const Choice(title: 'Agenda', icon: Icons.menu_book_outlined , ruta: 'agenda'),
  const Choice(title: 'Diagnósticos', icon: Icons.book, ruta: 'diagnosticos'),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.orange,
        child: InkWell(
            onTap: () => Navigator.pushNamed(context, choice.ruta),
            child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Icon(choice.icon, size: 30.0, color: Colors.white)),
                Text(
                  choice.title,
                  style: TextStyle(fontSize: 20),
                ),
              ]),
        )));
  }
}

Map<String, WidgetBuilder> getRutas() {
  return <String, WidgetBuilder>{
    'agenda': (BuildContext context) => Agenda(),
    'citaprevia': (BuildContext context) => CitaPrevia(),
    'consultas': (BuildContext context) => Consultas(),
    'diagnosticos': (BuildContext context) => Diagnosticos(),
    'informes': (BuildContext context) => Informes(),
    'medicacion': (BuildContext context) => Medicacion(),
  };
}
