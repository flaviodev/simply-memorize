class QuizList {
  final String id;
  final String name;
  final List<QuizSentence> sentences;

  QuizList(this.id, this.name, this.sentences);
}

class QuizSentence {
  final String key;
  final String value;

  QuizSentence({this.key, this.value});
}