import 'package:flutter/material.dart';
import 'package:memorize/application/mobile/components/countdown.dart';

class AnswerOperationForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnswerOperationFormState();
  }
}

class AnswerOperationFormState extends State<AnswerOperationForm>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  String _operation;
  FocusNode _focusNode = new FocusNode();

  final TextEditingController _answerController = TextEditingController();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_operation == null) initOperation("2 x 2 =");

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
                onCompleted: () => Navigator.pop(context)),
            TextField(
              controller: _answerController,
              autofocus: true,
              focusNode: _focusNode,
              onSubmitted: (answer) {
                printResult(answer);
              },
              style: TextStyle(
                fontSize: 48.0,
              ),
              decoration: InputDecoration(labelText: _operation),
              keyboardType: TextInputType.number,
            ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                printResult(_answerController.text);
              },
            ),
          ],
        ),
      ),
    );

    _animationController.forward(from: 0.0);

    return scaffold;
  }

  void printResult(String result) {
    debugPrint(">>> Result: $result");
    _animationController.dispose();
    initOperation("4 x 4 = ");
  }

  void initOperation(String operation) {
    _animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 10),
    );

    _operation = operation;
    _answerController.text = '';   
    FocusScope.of(context).requestFocus(_focusNode);
    setState(() {});
  }
}
