import 'package:flutter/material.dart';
import 'package:ico_app/paginas/agenda.dart';
import 'package:ico_app/paginas/cita-previa.dart';
import 'package:ico_app/paginas/consultas.dart';
import 'package:ico_app/paginas/diagnosticos.dart';
import 'package:ico_app/paginas/formulario-bienvenida-VIEJO.dart';
import 'package:ico_app/paginas/informes.dart';
import 'package:ico_app/paginas/medicacion.dart';
import 'package:ico_app/paginas/perfil.dart';
import 'auth-screens/Welcome/welcome_screen.dart';
import 'constants.dart';

void main() => runApp(MyApp());

double appBarHeight = 60.0;
bool formularioMostrado = true;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: checkWhatToShow(),
      initialRoute: '/',
      routes: getRutas(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => MyApp(),
        );
      },
    );
  }

  checkWhatToShow() {
    if (formularioMostrado) {
      return WelcomeScreen();
    } else {
      return FormularioBienvenida();
    }
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
        buildFloatingActionButton(context),
      ],
    );
  }

  static buildFloatingActionButton(BuildContext context) {

    return Positioned(
      child: new FloatingActionButton(
        heroTag: null,
        mini: true,
        backgroundColor: Colors.orange,
        child: new Icon(Icons.person),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Perfil()),
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
    'perfil': (BuildContext context) => Perfil()
  };
}
