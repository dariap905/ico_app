import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ico_app/paginas/agenda.dart';
import 'package:ico_app/paginas/cita-previa.dart';
import 'package:ico_app/paginas/consultas.dart';
import 'package:ico_app/paginas/cuenta.dart';
import 'package:ico_app/paginas/diagnosticos.dart';
import 'package:ico_app/paginas/informes.dart';
import 'package:ico_app/paginas/medicacion.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

double appBarHeight = 60.0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Cuenta(),
      initialRoute: '/',
      routes: getRutas(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => MyApp(),
        );
      },
    );
  }
}

class CommonThings {
  static Size size;
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Scaffold(
            appBar: buildAppBar(context),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildGridView(),
              ],
            )),
        buildfab(),
      ],
    );
  }

  static buildfab(){
    return Positioned(
      child: new FloatingActionButton(
        heroTag: null,
        mini: true,
        child: SpeedDial(
          marginEnd: 5,
          marginBottom: 645,
          icon: Icons.person,
          activeIcon: Icons.person,
          // iconTheme: IconThemeData(color: Colors.grey[50], size: 30),
          // label: Text("Open Speed Dial"),
          // activeLabel: Text("Close Speed Dial"),
          //labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
          buttonSize: 44.0,
          visible: true,
          closeManually: false,
          renderOverlay: false,
          curve: Curves.linear,
          //overlayColor: Colors.green,
          overlayOpacity: 0,
          //tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          elevation: 0,
          shape: CircleBorder(),
          orientation: SpeedDialOrientation.Down,
          //childMarginBottom: 20,
          //childMarginTop: 20,
          children: [
            SpeedDialChild(
              shape: CircleBorder(),
              child: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0
              ),
              backgroundColor: Colors.green,
              label: 'Perfil',
              labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
              onTap: () => print('Perfil'),
            ),
            SpeedDialChild(
              shape: CircleBorder(),
              child: Icon(Icons.accessibility),
              backgroundColor: Colors.green,
              label: 'Configuracion',
              labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
              onTap: () => print('Configuracion'),
            ),
            SpeedDialChild(
              shape: CircleBorder(),
              child: Icon(Icons.accessibility),
              backgroundColor: Colors.green,
              label: 'Extra',
              labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
              onTap: () => print('FIRST CHILD'),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
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
      title: 'Informes', icon: Icons.bookmarks_outlined, ruta: 'informes'),
  const Choice(
      title: 'Medicación', icon: Icons.list_alt_outlined, ruta: 'medicacion'),
  const Choice(title: 'Consultas', icon: Icons.map_outlined, ruta: 'consultas'),
  const Choice(title: 'Cita previa', icon: Icons.phone, ruta: 'citaprevia'),
  const Choice(title: 'Agenda', icon: Icons.menu_book_outlined, ruta: 'agenda'),
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
