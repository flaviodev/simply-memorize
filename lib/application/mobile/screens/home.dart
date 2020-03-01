import 'package:memorize/application/mobile/screens/profile/profile_list.dart';
import 'package:flutter/material.dart';
import 'package:memorize/application/mobile/screens/operation/choose_operations.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memorize'),
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/simply_memorize_logo.png'),
            ),
            Row(
              children: <Widget>[
                MenuItem("Profiles", Icons.people, ProfileList()),
                MenuItem("Time-Tables", Icons.functions, ChooseOperationsScreen()),
              ],
            ),
          ])),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String _description;
  final IconData _icon;
  final _targetScreen;

  MenuItem(this._description, this._icon, this._targetScreen);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: Theme.of(context).accentColor,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return _targetScreen;
              }));
            },
            child: Container(
                padding: EdgeInsets.all(8.0),
                height: 70,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(this._icon,
                        color: Theme.of(context).secondaryHeaderColor),
                    Text(this._description,
                        style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor)),
                  ],
                )),
          ),
        ));
  }
}
