import 'package:flutter/material.dart';

extension CloseKeyboard on BuildContext {
  void closeKeyboard() {
    FocusScope.of(this).unfocus();
  }
}
