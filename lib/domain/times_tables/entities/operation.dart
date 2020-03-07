import 'package:memorize/domain/times_tables/types/operation_type.dart';

class Operation {
  static const int NOT_ENTERED_ANSWER = -1;

  final int first;
  final int second;
  final OperationType type;
  int _enteredAnswer = NOT_ENTERED_ANSWER;

  Operation({this.first, this.second, this.type});

  void setAnswer(int value) {
    _enteredAnswer = value;
  }

  int getAnswer() {
    return _enteredAnswer;
  }

  int perform() {
    return type.perform(first, second);
  }

  bool isCorrect() {
    return _enteredAnswer == perform();
  }

  String getAnsweredOperation() {
    return "${toString()} ${getAnswer() != NOT_ENTERED_ANSWER ? getAnswer() : 'Not entered'}";
  }

  @override
  String toString() {
    return '$first ${type.signal} $second = ';
  }
}
