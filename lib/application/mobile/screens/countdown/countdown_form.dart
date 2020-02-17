import 'package:flutter/material.dart';
import 'package:memorize/application/mobile/components/countdown.dart';

class CountdownForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CountdownFormState();
  }
}

class CountdownFormState extends State<CountdownForm>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 10),
    );

    final scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Countdown'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CountdownWidget(
                tricker: this,
                controller: _controller,
                onCompleted: () => Navigator.pop(context)),
          ],
        ),
      ),
    );

    _controller.forward(from: 0.0);

    return scaffold;
  }
}
