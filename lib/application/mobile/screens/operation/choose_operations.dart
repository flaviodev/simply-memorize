import 'package:flutter/material.dart';
import 'package:memorize/application/mobile/screens/operation/answer_operation.dart';
import 'package:memorize/domain/table/types/operation_type.dart';

class ChooseOperationsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChooseOperationsScreenState();
  }
}

class ChooseOperationsScreenState extends State<ChooseOperationsScreen> {
  final List<bool> _tablesSelections = List.generate(9, (_) => false);
  final List<bool> _operationsSelections = List.generate(4, (_) => false);

  bool _trainingButtonEnable = false;

  void _validateTrainingButton() {
    bool anyOperationSelected = false;
    bool anyTableSelected = false;

    for (var operationSelection in _operationsSelections) {
      if (operationSelection) {
        anyOperationSelected = true;
        break;
      }
    }

    for (var tableSelection in _tablesSelections) {
      if (tableSelection) {
        anyTableSelected = true;
        break;
      }
    }

    if (anyOperationSelected && anyTableSelected)
      _trainingButtonEnable = true;
    else
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
              Text("Pick at least one operation:"),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <TimesTableToogleButton>[
                    TimesTableToogleButton(
                        label: OperationType.addition.signal,
                        onTap: (selected) => {
                              _operationsSelections[0] = selected,
                              _validateTrainingButton()
                            },
                        width: 70),
                    TimesTableToogleButton(
                        label: OperationType.subtraction.signal,
                        onTap: (selected) => {
                              _operationsSelections[1] = selected,
                              _validateTrainingButton()
                            },
                        width: 70),
                    TimesTableToogleButton(
                        label: OperationType.multiplication.signal,
                        onTap: (selected) => {
                              _operationsSelections[2] = selected,
                              _validateTrainingButton()
                            },
                        width: 70),
                    TimesTableToogleButton(
                        label: OperationType.division.signal,
                        onTap: (selected) => {
                              _operationsSelections[3] = selected,
                              _validateTrainingButton()
                            },
                        width: 70),
                  ]),
              Text("Pick at least one table:"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _toogleButtonsForTables([2, 3, 4]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _toogleButtonsForTables([5, 6, 7]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _toogleButtonsForTables([8, 9, 10]),
              ),
              RaisedButton(
                child: Text('Training'),
                onPressed: _trainingButtonEnable
                    ? () => {
                          Navigator.pop(context),
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AnswerOperationForm(
                              tables: _selectedTables(),
                              operationsTypes: _selectedOperations(),
                            );
                          }))
                        }
                    : null,
              ),
            ])));
  }

  List<TimesTableToogleButton> _toogleButtonsForTables(List<int> tables) {
    return tables
        .map((t) => TimesTableToogleButton(
            label: "$t",
            onTap: (selected) => {
                  _tablesSelections[t - 2] = selected,
                  _validateTrainingButton()
                }))
        .toList();
  }

  List<int> _selectedTables() {
    List<int> tables = List();

    for (var i = 0; i < _tablesSelections.length; i++)
      if (_tablesSelections[i]) tables.add(i + 2);

    return tables;
  }

  List<OperationType> _selectedOperations() {
    List<OperationType> operations = List();

    if (_operationsSelections[0]) operations.add(OperationType.addition);

    if (_operationsSelections[1]) operations.add(OperationType.subtraction);

    if (_operationsSelections[2]) operations.add(OperationType.multiplication);

    if (_operationsSelections[3]) operations.add(OperationType.division);

    return operations;
  }
}

class TimesTableToogleButton extends StatefulWidget {
  final String label;
  final Function onTap;
  final double width;

  TimesTableToogleButton({this.label, this.onTap, this.width = 100});

  @override
  State<StatefulWidget> createState() {
    return TimesTableToogleButtonState(
        label: this.label, onTap: this.onTap, width: this.width);
  }
}

class TimesTableToogleButtonState extends State<TimesTableToogleButton> {
  bool _selected = false;
  final Function onTap;
  final String label;
  final double width;

  TimesTableToogleButtonState({this.label, this.onTap, this.width = 100});

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
                width: this.width,
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
