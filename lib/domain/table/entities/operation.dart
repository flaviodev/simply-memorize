import 'package:memorize/domain/table/types/operation_type.dart';

class Operation {
  final int first;
  final int second;
  final OperationType type;
  int _answer = -1;

  Operation({this.first, this.second, this.type});

  void answer(int value) {
    _answer = value;
  }

  int getAnswer() {
    return _answer;
  }

  int perform() {
    return type.perform(first, second);
  }

  bool isCorrect() {
    return _answer == perform();
  }

  @override
  String toString() {
    return '$first ${type.signal} $second = ';
  }
}
