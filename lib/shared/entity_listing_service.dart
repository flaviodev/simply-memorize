abstract class EntityListingService<T> {
  Future<List<T>> findAll();
}