import 'dart:developer';

import 'package:desafio_salaryfits/data/data.dart';

import '../../../domain/domain.dart';

class LocalSaveSettingUsecase implements SaveSettingUsecase {
  LocalSaveSettingUsecase({
    required this.cacheStorage,
  });
  final CacheStorage cacheStorage;
  @override
  Future<void> call({required SettingEntity setting}) async {
    final json = LocalSettingModel.toModel(setting).toJson();

    log(json);
  }
}
