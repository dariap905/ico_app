import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';
import '../main.dart';

class Consultas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHomePage.buildAppBar(context),
      body: Container(
        decoration: MyHomePage.buildDecor(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Consultas',
                style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
                child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    padding: const EdgeInsets.all(60),
                    children: List.generate(choicesUserConsultas.length, (index) {
                      return Center(
                        child: SelectCardUser(choiceUser: choicesUserConsultas[index]),
                      );
                    }))
            )
          ],
        ),
      ),
    );
  }
}

class SelectCardUser extends StatelessWidget {
  const SelectCardUser({Key ? key, required this.choiceUser}) : super(key: key);
  final ChoiceUser choiceUser;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: kPrimaryColor,
        child: InkWell(
            onTap: () {
              switch(choiceUser.activity) {
                case 'llamada': {
                  print('Llamada');
                  _makePhoneCall('tel:0597924917');
                }
                break;

                case 'email': {
                  print('Email');
                }
                break;

                case 'videollamada': {
                  print('Videollamada');
                }
                break;

                default: {
                  print('Something went wrong.');
                }
                break;
              }
            },
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child:
                        Icon(choiceUser.icon, size: 30.0, color: Colors.white)),
                    Text(
                      choiceUser.title,
                      style: TextStyle(fontSize: 14),
                    ),
                  ]),
            )));
  }
}

Future<void> _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class ChoiceUser {
  const ChoiceUser({required this.title, required this.icon, required this.activity});
  final String title;
  final IconData icon;
  final String activity;
}

const List<ChoiceUser> choicesUserConsultas = const <ChoiceUser>[
  const ChoiceUser(title: 'Llamada', icon: Icons.phone, activity: 'llamada'),
  const ChoiceUser(title: 'Email', icon: Icons.email,  activity: 'email'),
  const ChoiceUser(title: 'Videollamada', icon: Icons.video_call,  activity: 'videollamada'),
];