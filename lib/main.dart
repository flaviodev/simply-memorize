import 'package:memorize/application/config/di.dart';
import 'package:memorize/application/mobile/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

void main() {
   runApp(MemorizeApp());
}

class MemorizeApp extends StatelessWidget {
  static final injector = DependencyInjection().initialise(Injector.getInjector());
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.teal[600],
          accentColor: Colors.redAccent[400],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.redAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: Home());
  }
}