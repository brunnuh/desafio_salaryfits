import 'dart:convert';

import 'package:http/http.dart';

import '../../data/data.dart';

class HttpAdapter implements HttpClient {
  HttpAdapter({
    required this.client,
  });
  final Client client;

  @override
  Future<dynamic> call({
    required String url,
    required Method method,
    Map? body,
    Map? headers,
  }) async {
    final uri = Uri.parse(url);
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
        {'content-type': 'application/json', 'accept': 'application/json'},
      );

    Response response = Response('', 500);
    if (method == Method.get) {
      response = await client.get(uri, headers: defaultHeaders);
    }
    return jsonDecode(response.body);
  }
}
