import 'package:memorize/application/config/database/db_provider.dart';
import 'package:memorize/domain/profile/profile_repository.dart';
import 'package:memorize/domain/profile/profile_service.dart';
import 'package:memorize/domain/table/table_service.dart';
import 'package:memorize/resources/repositories/profile_repository_db.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:sqflite/sqlite_api.dart';

class DependencyInjection {
  Injector initialise(Injector injector) {
    // database
    injector.map<Future<Database>>((i) => DBProvider().database(),
        isSingleton: true);

    // Profile
    injector.map<ProfileRepository>(
        (i) => ProfileRepositoryDb(i.get<Future<Database>>()),
        isSingleton: true);
    injector.map<ProfileService>(
        (i) => ProfileService(i.get<ProfileRepository>()),
        isSingleton: true);

    // Table
    injector.map<TableService>((i) => TableService(), isSingleton: true);

    return injector;
  }
}
