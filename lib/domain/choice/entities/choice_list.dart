class ChoiceList {
  final String id;
  final String name;
  final List<Question> questions;

  ChoiceList(this.id, this.name, this.questions);
}

class Question {
  final String key;
  final String value;

  Question({this.key, this.value});
}