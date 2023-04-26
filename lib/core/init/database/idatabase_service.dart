import 'database_response.dart';

abstract class IDatabaseService {
  Future<void> init();
  Future<void> dispose();
  Future<DatabaseResponse<void>> insert({
    required String table,
    required String id,
    required String jsonData,
  });
  Future<DatabaseResponse<void>> update({
    required String table,
    required String id,
    required String jsonData,
  });
  Future<DatabaseResponse<void>> delete({
    required String table,
    required String id,
  });
  Future<DatabaseResponse<List<Map<String, dynamic>>>> query({
    required String table,
    Map<String, dynamic>? where,
  });
}
