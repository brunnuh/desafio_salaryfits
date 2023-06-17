import 'package:flutter/material.dart';

import '../../../../main/factories/factories.dart';
import '../../../../presentation/presentation.dart';

Widget makeSettingsScreen() {
  return SettingsScreen(bloc: makeSettingsBloc());
}
