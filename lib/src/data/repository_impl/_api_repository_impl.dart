part of e_quran_id;

class _ApiRepositoryImpl extends _ApiRepository {
  static const requestTimeOut = Duration(seconds: 10);
  static final _singleton = _ApiRepositoryImpl();
  static _ApiRepositoryImpl get instance => _singleton;

  @override
  Future<String> request(
    String endPoint, {
    HTTPMethod? method,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    log(endPoint, name: '${method ?? HTTPMethod.get}');
    try {
      final requestHeaders = headers ?? {};
      requestHeaders['Content-Type'] = 'application/json';

      final client = HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);

      client.connectionTimeout = requestTimeOut;
      final request = await client.openUrl(
          method != null
              ? method.toMethodString()
              : HTTPMethod.get.toMethodString(),
          Uri.parse(endPoint));

      requestHeaders.forEach(
        (key, value) {
          request.headers.add(key, value);
        },
      );

      if (body != null) {
        request.write(json.encode(body));
      }

      final response = await request.close();

      final responseBody = await response.transform(utf8.decoder).join();

      return _handleResponse(response.statusCode, responseBody);
    } on TimeoutException catch (e, s) {
      throw FetchDataException(
        message: 'Request time out',
        data: e,
        stackTrace: s,
      );
    } on SocketException catch (e, s) {
      throw FetchDataException(
          message: 'Connection Error', data: e, stackTrace: s);
    } catch (e, s) {
      throw FetchDataException(message: '$e', data: e, stackTrace: s);
    }
  }

  String _handleResponse(int statusCode, String responseBody) {
    if (statusCode == 200) {
      return responseBody;
    } else {
      String message = 'Error';
      try {
        message = json.decode(responseBody)['message'];
      } catch (_) {
        message = _handleError(statusCode);
      }
      throw FetchDataException(message: message);
    }
  }

  String _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthenticated';
      case 402:
        return 'Payment required';
      case 403:
        return 'Forbidden';
      case 404:
        return "Page not found";
      case 405:
        return "Method not allowed";
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }
}

enum HTTPMethod { get, post, delete, put, patch }

extension HttpMethodToString on HTTPMethod {
  String toMethodString() {
    switch (this) {
      case HTTPMethod.get:
        return "GET";
      case HTTPMethod.post:
        return "POST";
      case HTTPMethod.delete:
        return "DELETE";
      case HTTPMethod.patch:
        return "PATCH";
      case HTTPMethod.put:
        return "PUT";
    }
  }
}
