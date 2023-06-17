import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../../main/factories/factories.dart';

LoadSettingUsecase makeLocalLoadSettingsUsecase() {
  return LocalLoadSettingUsecase(
    cacheStorage: makeCacheFactory(),
  );
}
