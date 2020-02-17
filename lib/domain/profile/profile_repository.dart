import 'package:memorize/domain/profile/entities/profile.dart';

abstract class ProfileRepository {
  Future<int> create(Profile profile);
  Future<List<Profile>> findAll();
}
