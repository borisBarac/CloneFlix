// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

enum TshirtSize {
  S,
  M,
  L,
}

TshirtSize getTshirtSizeFor(BuildContext context) {
  final h = MediaQuery.of(context).size.width;
  if (h >= 0 && h <= 470) {
    return TshirtSize.S;
  } else if (h >= 470 && h <= 750) {
    return TshirtSize.M;
  }
  return TshirtSize.L;
}
