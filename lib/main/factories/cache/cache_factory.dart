import 'package:desafio_salaryfits/data/data.dart';
import 'package:desafio_salaryfits/infra/infra.dart';
import 'package:localstorage/localstorage.dart';

CacheStorage makeCacheFactory() {
  return CacheAdapter(
    localStorage: LocalStorage('desafioSalaryfits'),
  );
}
