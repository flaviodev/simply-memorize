import 'package:memorize/application/mobile/screens/countdown/countdown_form.dart';
import 'package:memorize/application/mobile/screens/profile/profile_list.dart';
import 'package:flutter/material.dart';

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
              child: Image.asset('assets/images/memorize.png'),
            ),
            Row(
              children: <Widget>[
                MenuItem("Profiles", Icons.people, ProfileList()),
                MenuItem("Countdown", Icons.watch_later, CountdownForm()),
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
                width: 90,
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