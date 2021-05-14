import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class HomeAdmin extends StatelessWidget {
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
                'ADMIN',
                style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
                child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    padding: const EdgeInsets.all(60),
                    children: List.generate(choicesAdmin.length, (index) {
                      return Center(
                        child: SelectCard(choice: choicesAdmin[index]),
                      );
                    }))
            )
          ],
        ),
      )
    );
  }
}

const List<Choice> choicesAdmin = const <Choice>[
  const Choice(title: 'Home', icon: Icons.home, ruta: 'home'),
  const Choice(title: 'Chat', icon: Icons.contacts, ruta: 'chat'),
  const Choice(title: 'Buscar', icon: Icons.search, ruta: 'buscar'),
  const Choice(title: 'WIP', icon: Icons.phone, ruta: 'wip'),
];