import '../domain.dart';

abstract interface class SaveSettingUsecase {
  Future<void> call({required SettingEntity setting});
}
