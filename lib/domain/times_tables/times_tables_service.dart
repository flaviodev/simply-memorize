import 'package:memorize/domain/times_tables/entities/operation.dart';
import 'package:memorize/domain/times_tables/types/operation_type.dart';

class TimesTablesService {
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
