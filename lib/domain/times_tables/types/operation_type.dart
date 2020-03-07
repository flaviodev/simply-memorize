import 'package:memorize/domain/times_tables/entities/operation.dart';

enum OperationType { addition, subtraction, multiplication, division }

extension OperationTypeExtension on OperationType {
  String get signal {
    switch (this) {
      case OperationType.addition:
        return '+';
      case OperationType.subtraction:
        return '-';
      case OperationType.multiplication:
        return 'x';
      case OperationType.division:
        return '÷';
      default:
        return null;
    }
  }

  List<Operation> tablesFor(int table) {
    switch (this) {
      case OperationType.addition:
        return _tablesFor((int i) => i + 1, table, this);
      case OperationType.subtraction:
        return _tablesFor((int i) => i + table, table, this);
      case OperationType.multiplication:
        return _tablesFor((int i) => i + 1, table, this);
      case OperationType.division:
        return _tablesFor((int i) => (i + 1) * table, table, this);
      default:
        return null;
    }
  }

  List<Operation> _tablesFor(Function forFirst, int table, OperationType type) {
    return new List<int>.generate(10, forFirst)
        .map((i) => Operation(first: i, second: table, type: type))
        .toList();
  }

  int perform(int first, int second) {
    switch (this) {
      case OperationType.addition:
        return first + second;
      case OperationType.subtraction:
        return first - second;
      case OperationType.multiplication:
        return first * second;
      case OperationType.division:
        return first ~/ second;
      default:
        return null;
    }
  }
}

extension on List<OperationType> {
  OperationType bySignal(String signal) {
    for (var operation in OperationType.values) {
      if (operation.signal == signal) return operation;
    }

    return null;
  }
}
