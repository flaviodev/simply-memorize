class ChoiceQuestion {
  final String id;
  final String key;
  final List<String> alternatives;
  final String expectedAnswer;
  String _enteredAnswer = "";

  ChoiceQuestion({this.id, this.key, this.alternatives, this.expectedAnswer});

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
