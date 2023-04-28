part of e_quran_id;

abstract class _ApiRepository {
  Future<String> request(
    String endPoint, {
    HTTPMethod? method,
    Map<String, String>? headers,
    dynamic body,
  });
}
