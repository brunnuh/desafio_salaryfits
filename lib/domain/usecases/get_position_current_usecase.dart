abstract interface class GetPositionCurrentUsecase {
  Future<({double lat, double lon})> call();
}
