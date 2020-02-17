import 'package:memorize/domain/profile/profile_repository.dart';
import 'package:memorize/domain/profile/entities/profile.dart';
import 'package:sqflite/sqlite_api.dart';

class ProfileRepositoryDb implements ProfileRepository {
  final Future<Database> _database;

  ProfileRepositoryDb(this._database);

  @override
  Future<int> create(Profile profile) async {
    final db = await _database;
    return await db.insert(_tableName, profile.toMap());
  }

  @override
  Future<List<Profile>> findAll() async {
    final db = await _database;
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return result.map((row) => row.toObject()).toList();
  }
}

final String _tableName = 'profiles';
final String _id = 'id';
final String _name = 'name';

extension on Profile {
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> row = Map();
    row[_id] = this.id;
    row[_name] = this.name;
    return row;
  }
}

extension on Map<String, dynamic> {
  Profile toObject() {
    return Profile(
      this[_id],
      this[_name],
    );
  }
}
