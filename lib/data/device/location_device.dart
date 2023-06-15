abstract interface class LocationDevice {
  Future<({double lat, double lon})> call();
}
