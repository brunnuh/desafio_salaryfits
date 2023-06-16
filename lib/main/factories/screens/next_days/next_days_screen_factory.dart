import 'package:flutter/material.dart';

import '../../../../presentation/presentation.dart';
import 'next_days_bloc_factory.dart';

Widget makeNextDaysScreen() {
  return NextDaysScreen(
    bloc: makeNextDaysBloc(),
  );
}
