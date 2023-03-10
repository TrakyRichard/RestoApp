import 'package:das/das.dart';
import 'package:dio/dio.dart' as Dio;

Dio.Dio dio() {
  final dio = Dio.Dio();
  return dio;
}

class ApiService extends CrudDAS {
  @override
  Future<dynamic> delete(String id, String endpoint) async {
    await dio().delete("$endpoint/$id").then((value) {
      if (value.data["status"] == "OK" && value.data["data"] != null) {
        return value.data["data"];
      }
    }).catchError((e) {
      throw e.message;
    });
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getAll(String endpoint) async {
    return await dio().get(endpoint).then((value) {
      if (value.data["status"] == "OK" && value.data["data"] != null) {
        return value.data["data"];
      }
      throw value.data["message"];
    }).catchError((e) {
      throw e.message;
    });
  }

  @override
  Future<Map<String, dynamic>> getById(String id, String endpoint) async {
    return await dio().get("$endpoint/$id").then((value) {
      if (value.data["status"] == "OK" && value.data["data"] != null) {
        return value.data["data"];
      }
      throw value.data["message"];
    }).catchError((e) {
      throw e.message;
    });
  }

  @override
  Future<dynamic> save(Map<String, dynamic> data, String endpoint) async {
    return await dio().put(endpoint, data: data).then((value) {
      if (value.data["status"] == "OK" && value.data["data"] != null) {
        return value.data["data"];
      }
      throw value.data["message"];
    }).catchError((e) {
      throw e.message;
    });
  }

  @override
  Future<dynamic> update(Map<String, dynamic> data, String endpoint) async {
    return await dio().put(endpoint, data: data).then((value) {
      if (value.data["status"] == "OK" && value.data["data"] != null) {
        return value.data["data"];
      }
      throw value.data["message"];
    }).catchError((e) {
      throw e.message;
    });
  }
}
