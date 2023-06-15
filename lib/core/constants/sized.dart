import 'package:flutter/material.dart';

class Sized {
  static const small = 8.0;
  static const middle = 16.0;
  static const bigger = 32.0;
}

extension Paddings on double {
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);
  EdgeInsets get all => EdgeInsets.all(this);
  EdgeInsets get left => EdgeInsets.only(left: this);

  SizedBox get verticalSized => SizedBox(height: this);
  SizedBox get horizontalSized => SizedBox(width: this);
}
