import 'package:memorize/application/mobile/components/result_list.dart';
import 'package:memorize/domain/table/entities/operation.dart';
import 'package:flutter/material.dart';

class OpeationResultList extends StatefulWidget {
  final List<Operation> items;

  const OpeationResultList({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OpeationResultState(items);
  }
}

class OpeationResultState extends ResultListState<Operation> {
  final List<Operation> _items;

  OpeationResultState(this._items)
      : super(title: 'Tables Result', items: _items);

  @override
  StatelessWidget toItem(Operation operation) {
    return OperationResultItem(operation: operation, icon: Icons.functions);
  }
}

class OperationResultItem extends StatelessWidget {
  final Operation operation;
  final IconData icon;

  OperationResultItem({this.operation, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(this.icon),
        title: Text("${operation.toString()} ${operation.getAnswer() != -1 ? operation.getAnswer() : 'Not entered'}",
            style: TextStyle(
                color: operation.isCorrect() ? Colors.green : Colors.red)),
        subtitle: Text(
            operation.isCorrect()
                ? ''
                : "Correct answer: ${operation.perform()}",
            style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
