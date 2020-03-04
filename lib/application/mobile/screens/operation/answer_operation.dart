import 'package:flutter/material.dart';
import 'package:memorize/application/mobile/components/countdown.dart';
import 'package:memorize/domain/table/entities/operation.dart';
import 'package:memorize/domain/table/table_service.dart';
import 'package:memorize/domain/table/types/operation_type.dart';
import 'package:memorize/main.dart';

class AnswerOperationForm extends StatefulWidget {
  final List<int> tables;
  final List<OperationType> operationsTypes;

  const AnswerOperationForm({Key key, this.tables, this.operationsTypes})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    tables.forEach((t) => debugPrint(t.toString()));

    return AnswerOperationFormState(tables, operationsTypes);
  }
}

class AnswerOperationFormState extends State<AnswerOperationForm>
    with TickerProviderStateMixin {
  final List<int> tables;
  final List<OperationType> operationsTypes;

  List<Operation> _operations;
  int _currentOperationIndex = 0;

  final TableService _service = MemorizeApp.injector.get<TableService>();

  AnimationController _animationController;
  Operation _operation;
  FocusNode _focusNode = new FocusNode();

  final TextEditingController _answerController = TextEditingController();

  AnswerOperationFormState(this.tables, this.operationsTypes) {
    _operations =
        _service.generateOperations(this.operationsTypes, this.tables);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_operation == null) nextOperation();

    var textField = TextField(
      controller: _answerController,
      autofocus: true,
      focusNode: _focusNode,
      onSubmitted: (answer) {
        perform(answer);
      },
      style: TextStyle(
        fontSize: 48.0,
      ),
      decoration: InputDecoration(labelText: _operation.toString()),
      keyboardType: TextInputType.number,
    );

    final scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Training'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CountdownWidget(
                tricker: this,
                controller: _animationController,
                onCompleted: () => timeOut()),
            TextField(
              controller: _answerController,
              autofocus: true,
              focusNode: _focusNode,
              onSubmitted: (answer) {
                perform(answer);
              },
              style: TextStyle(
                fontSize: 48.0,
              ),
              decoration: InputDecoration(labelText: _operation.toString()),
              keyboardType: TextInputType.number,
            ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                perform(_answerController.text);
              },
            ),
          ],
        ),
      ),
    );

    _animationController.forward(from: 0.0);

    return scaffold;
  }

  void perform(String result) {
    _animationController.dispose();
    var entered = int.parse(result);
    var performed = _operation.perform();
    var correct = _operation.isCorrect(entered);

    _answerController.text = "$result (${correct ? 'correct' : 'incorrect'})";

    print(
        "${_operation.toString()} $performed (entered amounnt: $result -> ${correct ? 'correct' : 'incorrect'})");
    
    nextOperation();
  }

  void nextOperation() {
    if (_currentOperationIndex >= _operations.length) {
      Navigator.pop(context);
    }

    _animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 10),
    );

    _operation = _operations[_currentOperationIndex];
    _currentOperationIndex++;

    _answerController.text = '';
    FocusScope.of(context).requestFocus(_focusNode);
    setState(() {});
  }

  void timeOut() {
    print("time out!");
    nextOperation();
  }
}
