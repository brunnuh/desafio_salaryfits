import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../../main/factories/factories.dart';

SaveSettingUsecase makeSaveSettingUsecaseFactory() {
  return LocalSaveSettingUsecase(
    cacheStorage: makeCacheFactory(),
  );
}
