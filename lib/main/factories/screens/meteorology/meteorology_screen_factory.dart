import 'package:flutter/material.dart';

import './meteorology_bloc_factory.dart';
import '../../../../presentation/presentation.dart';

Widget makeMeteorologyScreen() {
  return MeteorologyScreen(
    bloc: makeMeteorologyBloc(),
  );
}
