import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String _title;
  final String _subtitle;
  final IconData _icon;

  ListItem(this._title, this._subtitle, this._icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(this._icon),
        title: Text(this._title),
        subtitle: Text(this._subtitle),
      ),
    );
  }
}