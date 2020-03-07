class QuizQuestion {
  final String id;
  final String key;
  final List<String> options;
  final String expectedAnswer;
  String _enteredAnswer = "";

  QuizQuestion({this.id, this.key, this.options, this.expectedAnswer});

  void setAnswer(String value) {
    _enteredAnswer = value;
  }

  String getAnswer() {
    return _enteredAnswer;
  }

  bool isCorrect() {
    return _enteredAnswer == expectedAnswer;
  }
}
