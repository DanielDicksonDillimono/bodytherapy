import 'package:flutter/material.dart';

GestureTapCallback dismissKeyboard(BuildContext context) {
  return () => FocusScope.of(context).unfocus();
}
