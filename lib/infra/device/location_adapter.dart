import 'package:geolocator/geolocator.dart';

import '../../data/data.dart';

class LocationAdapter implements LocationDevice {
  @override
  Future<({double lat, double lon})> call() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }
    final position = await Geolocator.getCurrentPosition();

    return (lat: position.latitude, lon: position.longitude);
  }
}
