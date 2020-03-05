import 'package:flutter/material.dart';

abstract class ResultListState<T> extends State {
  final String title;
  final List<T> items;

  StatelessWidget toItem(T entity);

  ResultListState({this.title, this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final entity = items[index];
            return toItem(entity);
          }),
    );
  }
}
