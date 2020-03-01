import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  ListItem({this.title, this.icon, this.subtitle = ''});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(this.icon),
        title: Text(this.title),
        subtitle: Text(this.subtitle),
      ),
    );
  }
}
