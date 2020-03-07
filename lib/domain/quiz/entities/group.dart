import 'package:memorize/domain/quiz/entities/sub_group.dart';

class Group {
  final String id;
  final String name;
  final List<SubGroup> subGroups;

  Group({this.id, this.name, this.subGroups});
}
