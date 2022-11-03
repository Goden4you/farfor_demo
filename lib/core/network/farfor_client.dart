import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:farfor_demo/core/constants/environment.dart';
import 'package:farfor_demo/core/network/responce_transformer.dart';

class FarforClient {
  FarforClient();

  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: Environment.baseUrl,
        connectTimeout: 60000,
        receiveTimeout: 60000,
        sendTimeout: 60000,
        contentType: 'application/json; charset=utf-8',
        responseType: ResponseType.json,
      ),
    )
      ..transformer = ComputeTransformer()
      ..interceptors.addAll([
        LogInterceptor(requestBody: true, responseBody: true),
        InterceptorsWrapper(
          onResponse: (response, handler) {
            if (response.requestOptions.method == 'GET') {
              response.data = json.decode(response.data as String);
            }
            return handler.next(response);
          },
        ),
      ]);
  }
}
