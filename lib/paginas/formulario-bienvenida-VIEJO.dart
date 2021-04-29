/*
import 'package:flutter/material.dart';

class FormularioBienvenida extends StatefulWidget {

  @override
  _FormularioBienvenidaState createState() => _FormularioBienvenidaState();
}

class _FormularioBienvenidaState extends State<FormularioBienvenida> {

  int _currentStep = 0;
  // 1 = basica (app simple), 2 = intermedio (app normal), 3 = avanzado (app normal)
  // de momento todas las opciones llevan a la app normal
  int _versionApp = 1;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    List<RadioModel> paso2 = [
      RadioModel(false, "Básico", Icons.looks_one),
      RadioModel(false, "Intermedio", Icons.looks_two),
      RadioModel(false, "Avanzado", Icons.looks_3),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Formulario de bienvenida'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
            onStepContinue: () {
                  if(_currentStep == 2){
                    //todo
                  }
            },
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text('Cuenta'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Nombre'),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Este campo no puede estar vacío';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Apellido'),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Este campo no puede estar vacío';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Conocimientos informáticos'),
                    content: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 10),
                            ),
                          ],
                        ),
                        SelectableCard(options: paso2),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}

class SelectableCard extends StatefulWidget {
  final List<RadioModel> options;

  SelectableCard({@required this.options});

  @override
  _SelectableCardState createState() => _SelectableCardState();
}

class _SelectableCardState extends State<SelectableCard> {
  List<RadioModel> sampleData = [];

  @override
  void initState() {
    super.initState();
    sampleData = widget.options;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 2.5),
      ),
      itemCount: sampleData.length,
      itemBuilder: (context, index) {
        return Card(
          shape: sampleData[index].isSelected
              ? RoundedRectangleBorder(
                  side: BorderSide(color: Colors.indigoAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0))
              : RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey[200], width: 2.0),
                  borderRadius: BorderRadius.circular(4.0)),
          color: Colors.white,
          elevation: 0,
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
              });
            },
            child: GridTile(child: RadioItem(sampleData[index])),
          ),
        );
      },
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              _item.icon,
              color: _item.isSelected ? Colors.indigoAccent : Colors.grey[500],
              size: 25,
            ),
            Text(
              _item.time,
              style: TextStyle(
                fontSize: 15,
                color:
                    _item.isSelected ? Colors.indigoAccent : Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  String time;
  IconData icon;

  RadioModel(this.isSelected, this.time, this.icon);
}
*/
