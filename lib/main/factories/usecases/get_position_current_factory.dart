import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../device/device.dart';

GetPositionCurrentUsecase makeGetPositionCurrentFactory() {
  return LocalGetPositionCurrentUsecase(locationDevice: makeLocationFactory());
}
