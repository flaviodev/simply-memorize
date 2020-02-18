import 'package:flutter/material.dart';
import 'package:memorize/application/mobile/screens/countdown/countdown_form.dart';

class ChooseTablesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChooseTablesScreenState();
  }
}

class ChooseTablesScreenState extends State<ChooseTablesScreen> {
  final List<bool> _selections = List.generate(9, (_) => false);
  bool _trainingButtonEnable = false;

  void _validateTrainingButton() {
    for (var selection in _selections) {
      if (selection) {
        _trainingButtonEnable = true;
        setState(() {});
        return;
      }
    }

    _trainingButtonEnable = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Tables'),
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TimesTableToogleButton(
                      " 2 X ",
                      (selected) => {
                            _selections[0] = selected,
                            _validateTrainingButton()
                          }),
                  TimesTableToogleButton(
                      " 3 X ",
                      (selected) => {
                            _selections[1] = selected,
                            _validateTrainingButton()
                          }),
                  TimesTableToogleButton(
                      " 4 X ",
                      (selected) => {
                            _selections[2] = selected,
                            _validateTrainingButton()
                          }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TimesTableToogleButton(
                      " 5 X ",
                      (selected) => {
                            _selections[3] = selected,
                            _validateTrainingButton()
                          }),
                  TimesTableToogleButton(
                      " 6 X ",
                      (selected) => {
                            _selections[4] = selected,
                            _validateTrainingButton()
                          }),
                  TimesTableToogleButton(
                      " 7 X ",
                      (selected) => {
                            _selections[5] = selected,
                            _validateTrainingButton()
                          }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TimesTableToogleButton(
                      " 8 X ",
                      (selected) => {
                            _selections[6] = selected,
                            _validateTrainingButton()
                          }),
                  TimesTableToogleButton(
                      " 9 X ",
                      (selected) => {
                            _selections[7] = selected,
                            _validateTrainingButton()
                          }),
                  TimesTableToogleButton(
                      " 10 X ",
                      (selected) => {
                            _selections[8] = selected,
                            _validateTrainingButton()
                          }),
                ],
              ),
              RaisedButton(
                child: Text('Training'),
                onPressed: _trainingButtonEnable
                    ? () => {
                          Navigator.pop(context),
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CountdownForm();
                          }))
                        }
                    : null,
              ),
            ])));
  }
}

class TimesTableToogleButton extends StatefulWidget {
  final String label;
  final Function onTap;

  TimesTableToogleButton(this.label, this.onTap);

  @override
  State<StatefulWidget> createState() {
    return TimesTableToogleButtonState(this.label, this.onTap);
  }
}

class TimesTableToogleButtonState extends State<TimesTableToogleButton> {
  bool _selected = false;
  final Function onTap;
  final String label;

  TimesTableToogleButtonState(this.label, this.onTap);

  bool get selected {
    return this._selected;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: _selected
              ? Theme.of(context).primaryColor
              : Theme.of(context).secondaryHeaderColor,
          child: InkWell(
            onTap: () {
              _selected = !_selected;
              setState(() {
                Function.apply(onTap, [_selected]);
              });
            },
            child: Container(
                padding: EdgeInsets.all(8.0),
                height: 70,
                width: 100,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(this.label,
                          style: TextStyle(
                              color: _selected
                                  ? Theme.of(context).secondaryHeaderColor
                                  : Theme.of(context).primaryColor)),
                    ])),
          ),
        ));
  }
}
