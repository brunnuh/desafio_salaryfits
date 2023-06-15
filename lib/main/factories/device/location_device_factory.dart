import 'package:desafio_salaryfits/data/data.dart';
import 'package:desafio_salaryfits/infra/device/location_adapter.dart';

LocationDevice makeLocationFactory() {
  return LocationAdapter();
}
