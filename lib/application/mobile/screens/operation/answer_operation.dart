import 'package:flutter/material.dart';
import 'package:memorize/application/mobile/components/countdown.dart';
import 'package:memorize/application/mobile/screens/operation/operation_result_list.dart';
import 'package:memorize/domain/times_tables/entities/operation.dart';
import 'package:memorize/domain/times_tables/times_tables_service.dart';
import 'package:memorize/domain/times_tables/types/operation_type.dart';
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

  int _correctAnswers = 0;
  int _incorrectAnswers = 0;

  final TimesTablesService _service = MemorizeApp.injector.get<TimesTablesService>();

  AnimationController _animationController;
  Operation _operation;
  FocusNode _focusNode = new FocusNode();

  final TextEditingController _answerController = TextEditingController();

  AnswerOperationFormState(this.tables, this.operationsTypes) {
    _operations =
        _service.generateOperations(this.operationsTypes, this.tables);
    _setOperation();
  }

  @override
  void dispose() {
    if (_animationController.isAnimating) _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                onCompleted: () => _timeOut()),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _answerController,
                  autofocus: true,
                  focusNode: _focusNode,
                  onSubmitted: (answer) {
                    _perform(answer);
                  },
                  style: TextStyle(
                    fontSize: 48.0,
                  ),
                  decoration: InputDecoration(labelText: _operation.toString()),
                  keyboardType: TextInputType.number,
                )),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                _perform(_answerController.text);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("$_correctAnswers Corrects",
                        style: TextStyle(color: Colors.green))),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("$_incorrectAnswers Incorrects",
                        style: TextStyle(color: Colors.red))),
              ],
            ),
          ],
        ),
      ),
    );

    return scaffold;
  }

  void _perform(String result) {
    _animationController.dispose();
    var entered = int.tryParse(result);

    if(entered != null) 
      _operation.setAnswer(entered);

    if (_operation.isCorrect())
      _correctAnswers++;
    else
      _incorrectAnswers++;

    _nextOperation();
  }

  void _setOperation() {
    if (_currentOperationIndex >= _operations.length) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OpeationResultList(items: _operations),
        ),
      );
    }

    _operation = _operations[_currentOperationIndex];
    _currentOperationIndex++;

    _animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 10),
    );
    _animationController.forward(from: 0.0);
  }

  void _nextOperation() {
    _setOperation();
    _answerController.text = '';
    FocusScope.of(context).requestFocus(_focusNode);
    setState(() {});
  }

  void _timeOut() {
    print("time out!");
    _incorrectAnswers++;
    _nextOperation();
  }
}
