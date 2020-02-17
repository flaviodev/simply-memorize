import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

const _profiles = 'CREATE TABLE profiles ('
    'id VARCHAR(36) PRIMARY KEY, '
    'name TEXT)';

class DBProvider {
  Future<Database> database() {
    return getDatabasesPath().then((dbPath) {
      final String path = join(dbPath, 'memorize.db');

      return openDatabase(path, onCreate: (db, version) async {
        await db.execute(_profiles);
      }, version: 1);
    });
  }
}
