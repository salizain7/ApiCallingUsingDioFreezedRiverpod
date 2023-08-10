import 'package:flutter/material.dart';

import 'base_validator.dart';

class MinLengthValidator extends BaseValidator {
  final int minLength;
  final String message;

  MinLengthValidator({required this.minLength, required this.message});

  @override
  String getMessage(BuildContext? context) {
    return message;
  }

  @override
  bool validate(String value) {
    return value.length >= minLength;
  }
}
