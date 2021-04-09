import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ico_app/paginas/agenda.dart';
import 'package:ico_app/paginas/citas.dart';
import 'package:ico_app/paginas/consultas.dart';
import 'package:ico_app/paginas/faq.dart';
import 'package:ico_app/paginas/form.dart';
import 'package:ico_app/paginas/equipo.dart';
import 'package:ico_app/paginas/medicacion.dart';
import 'package:ico_app/paginas/perfil.dart';
import 'package:ico_app/paginas/tutorial.dart';
import 'auth-screens/Welcome/welcome_screen.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:open_appstore/open_appstore.dart';
import 'dart:io' show Platform;
import 'package:feature_discovery/feature_discovery.dart';
import 'constants.dart';


const String feature1 = 'feature1',
    feature2 = 'feature2',
    feature3 = 'feature3',
    feature4 = 'feature4',
    feature5 = 'feature5',
    feature6 = 'feature6',
    feature7 = 'feature7';

void main() {
  // You can increase the timeDilation value if you want to see
  // the animations more slowly.
  timeDilation = 1.0;

  runApp(MyApp());
}

double appBarHeight = 60.0;
bool formularioMostrado = false;

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
      return FormScreen();
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Tutorial()),
                          );
                        },
                        child: Text("Tutorial"),
                      )),
                  SizedBox(
                      width: double.infinity, // <-- match_parent
                      child: ElevatedButton(
                        onPressed: () {
/*                        *//*Other options:
                          * Platform.isAndroid
                            Platform.isFuchsia
                            Platform.isIOS
                            Platform.isLinux
                            Platform.isMacOS
                            Platform.isWindows*//*
                          if (Platform.isAndroid) {
                            StoreRedirect.redirect(
                                androidAppId: "cat.gencat.mobi.lamevasalut");
                          } else if (Platform.isIOS) {
                            StoreRedirect.redirect(iOSAppId: "1358288989");
                          }*/
                          OpenAppstore.launch(androidAppId: "cat.gencat.mobi.lamevasalut", iOSAppId: "1358288989");
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
      child: new FloatingActionButton(
        heroTag: null,
        mini: true,
        backgroundColor: kPrimaryLightColor,
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
    'citas': (BuildContext context) => Citas(),
    'consultas': (BuildContext context) => Consultas(),
    'faq': (BuildContext context) => FAQ(),
    'equipo': (BuildContext context) => Equipo(),
    'medicacion': (BuildContext context) => Medicacion(),
    'perfil': (BuildContext context) => Perfil(),
    'tutorial': (BuildContext context) => Tutorial()
  };
}
