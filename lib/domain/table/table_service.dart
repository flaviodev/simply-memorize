import 'package:memorize/domain/table/entities/operation.dart';
import 'package:memorize/domain/table/types/operation_type.dart';

class TableService {
  List<Operation> generateOperations(
      List<OperationType> types, List<int> tables) {
    var operations = List<Operation>();

    for (var type in types) {
      for (var table in tables) {
        operations.addAll(type.tablesFor(table));
      }
    }

    operations.shuffle();

    return operations;
  }
}
