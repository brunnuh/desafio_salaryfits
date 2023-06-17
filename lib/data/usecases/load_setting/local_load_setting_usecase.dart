import 'package:desafio_salaryfits/data/data.dart';

import '../../../domain/domain.dart';

class LocalLoadSettingUsecase implements LoadSettingUsecase {
  LocalLoadSettingUsecase({
    required this.cacheStorage,
  });
  final CacheStorage cacheStorage;

  @override
  Future<SettingEntity> call() async {
    final json = await cacheStorage.fetch('setting');

    return SettingEntity(
      unit: TemperatureUnit.celcius,
      language: Language.ptBr,
    );
  }
}
