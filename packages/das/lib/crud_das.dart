abstract class CrudDAS {
  Future<void> save(Map<String, dynamic> data, String endpoint);

  Future<void> delete(String id, String endpoint);

  Future<List<Map<String, dynamic>>> getAll(String endpoint);

  Future<Map<String, dynamic>> getById(String id, String endpoint);

  Future<void> update(Map<String, dynamic> data, String endpoint);
}
