abstract class CrudDAS {
  Future<dynamic> save(Map<String, dynamic> data, String endpoint);

  Future<dynamic> delete(String id, String endpoint);

  Future<List<Map<String, dynamic>>> getAll(String endpoint);

  Future<Map<String, dynamic>> getById(String id, String endpoint);

  Future<dynamic> update(Map<String, dynamic> data, String endpoint);
}
