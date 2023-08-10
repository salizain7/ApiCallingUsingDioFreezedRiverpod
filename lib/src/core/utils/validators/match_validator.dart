import 'package:flutter/material.dart';

import 'base_validator.dart';

class MatchValidator extends BaseValidator {
  final String value;
  final String message;

  MatchValidator({required this.value, required this.message});

  @override
  String getMessage(BuildContext? context) {
    return message;
  }

  @override
  bool validate(String value) {
    return value == this.value;
  }
}
