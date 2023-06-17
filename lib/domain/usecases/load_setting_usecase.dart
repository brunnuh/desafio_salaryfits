import '../../domain/domain.dart';

abstract interface class LoadSettingUsecase {
  Future<SettingEntity> call();
}
