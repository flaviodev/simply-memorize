import 'package:memorize/domain/profile/profile_repository.dart';
import 'package:memorize/domain/profile/entities/profile.dart';
import 'package:memorize/shared/entity_crud_service.dart';
import 'package:memorize/shared/entity_listing_service.dart';

class ProfileService
    implements EntityListingService<Profile>, EntityCrudService<Profile> {
      
  final ProfileRepository _repository;

  ProfileService(this._repository);

  Future<int> create(Profile profile) {
    return _repository.create(profile);
  }

  Future<List<Profile>> findAll() {
    return _repository.findAll();
  }
}
