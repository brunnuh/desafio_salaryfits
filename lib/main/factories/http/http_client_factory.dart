import 'package:http/http.dart';

import '../../../data/data.dart';
import '../../../infra/infra.dart';

HttpClient makeHttpClient() {
  final client = Client();
  return HttpAdapter(client: client);
}
