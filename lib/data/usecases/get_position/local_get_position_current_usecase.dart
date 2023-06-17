import '../../../domain/domain.dart';
import '../../data.dart';

class LocalGetPositionCurrentUsecase implements GetPositionCurrentUsecase {
  LocalGetPositionCurrentUsecase({
    required this.locationDevice,
  });
  final LocationDevice locationDevice;

  @override
  Future<({double lat, double lon})> call() async {
    return await locationDevice();
  }
}
