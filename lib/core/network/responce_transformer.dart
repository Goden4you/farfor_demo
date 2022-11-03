import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ComputeTransformer extends DefaultTransformer {
  ComputeTransformer() : super(jsonDecodeCallback: _parseJson);
}

_parseAndDecode(String responce) {
  return jsonDecode(responce);
}

_parseJson(String text) {
  return compute(_parseAndDecode, text);
}
