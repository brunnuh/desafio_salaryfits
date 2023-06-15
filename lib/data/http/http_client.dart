abstract interface class HttpClient {
  Future<dynamic> call({
    required String url,
    required Method method,
    Map? body,
    Map? headers,
    Map<String, dynamic>? params,
  });
}

enum Method {
  get,
  post,
}
