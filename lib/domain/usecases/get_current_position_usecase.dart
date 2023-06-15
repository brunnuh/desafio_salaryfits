abstract interface class GetCurrentPositionUsecase {
  Future<({double lat, double lon})> call();
}
