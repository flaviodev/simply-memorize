abstract class EntityCrudService<T> {
  Future<int> create(T entity);
}