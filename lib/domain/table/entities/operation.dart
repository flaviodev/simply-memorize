import 'package:memorize/domain/table/types/operation_type.dart';

class Operation {
  final int first;
  final int second;
  final OperationType type;

  Operation({this.first, this.second, this.type});

  int perform() {
    return type.perform(first, second);
  }

  bool isCorrect(int answer) {
    return answer == perform();
  }

  @override
  String toString() {
    return '$first ${type.signal} $second = ';
  }
}