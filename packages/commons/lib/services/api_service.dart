import 'package:das/das.dart';
import 'package:dio/dio.dart' as Dio;

Dio.Dio dio() {
  final dio = Dio.Dio();
  return dio;
}

class ApiService extends CrudDAS {
  @override
  Future<void> delete(String id, String endpoint) {
    dio().delete(endpoint).then((value) {
      return value;
    }).catchError((e) {
      throw e.message;
    });
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(String endpoint) async {
    final response = await dio().get(endpoint).then((value) {
      return value.data;
    }).catchError((e) {
      throw e.message;
    });
    return response;
  }

  @override
  Future<Map<String, dynamic>> getById(String id, String endpoint) async {
    final response = await dio().get("$endpoint/$id").then((value) {
      return value.data;
    }).catchError((e) {
      throw e.message;
    });
    return response;
  }

  @override
  Future<void> save(Map<String, dynamic> data, String endpoint) async {
    await dio().post(endpoint, data: data).then((value) {
      return value;
    }).catchError((e) {
      throw e.message;
    });
  }

  @override
  Future<void> update(Map<String, dynamic> data, String endpoint) async {
    await dio().put(endpoint, data: data).then((value) {
      return value;
    }).catchError((e) {
      throw e.message;
    });
  }
}
