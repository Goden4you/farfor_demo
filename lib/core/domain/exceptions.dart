import 'package:dio/dio.dart';
import 'package:farfor_demo/core/utils/navigation_service.dart';
import 'package:farfor_demo/generated/l10n.dart';

class ServerException implements Exception {
  final String title;
  final int status;
  final String detail;
  final DioErrorType? type;
  final int? timeoutSeconds;
  final String? errorType;

  ServerException({
    required this.title,
    required this.status,
    required this.detail,
    this.type,
    this.errorType,
    this.timeoutSeconds,
  });

  factory ServerException.fromResponse(
      dynamic data, DioErrorType type, int? statusCode) {
    final context = NavigationService.navigatorKey.currentContext;

    if ([
      DioErrorType.connectTimeout,
      DioErrorType.receiveTimeout,
      DioErrorType.sendTimeout
    ].contains(type)) {
      return ServerException(
        title: context != null
            ? S.of(context).connection_error_title
            : 'Connection error',
        status: 0,
        detail: context != null
            ? S.of(context).connection_error_detail
            : 'Oops! Check your internet connection',
        type: type,
      );
    }

    if (type == DioErrorType.other) {
      return ServerException(
        title: context != null
            ? S.of(context).unknown_error_title
            : 'Unknown error',
        status: 0,
        detail: context != null
            ? S.of(context).unknown_error_detail
            : 'Error occupired',
        type: type,
      );
    }

    try {
      String _data = data.toString();

      if (statusCode == 413) {
        return ServerException(
          title: context != null
              ? S.of(context).big_data_error_title
              : 'Unknown error',
          status: 0,
          detail: context != null
              ? S.of(context).big_data_error_detail
              : 'Request entity too large',
          type: type,
        );
      } else if (!_data.startsWith('<html>')) {
        return ServerException(
          title: data['title'] ?? '',
          status: data['status'] ?? -1,
          detail: data['detail'] ?? data['title'] ?? '',
          type: type,
          errorType: data['type'],
          timeoutSeconds: data['timeoutSeconds'],
        );
      } else {
        return ServerException(
          title: context != null
              ? S.of(context).unknown_error_title
              : 'Unknown error',
          status: 0,
          detail: context != null
              ? S.of(context).unknown_error_detail
              : 'Error occupired',
          type: type,
        );
      }
    } catch (e) {
      return ServerException(
        title: context != null
            ? S.of(context).unknown_error_title
            : 'Unknown error',
        status: 0,
        detail: context != null
            ? S.of(context).unknown_error_detail
            : 'Error occupired',
        type: type,
      );
    }
  }
}

class UnknownException implements Exception {
  final String title;
  final String detail;

  UnknownException({
    this.title = 'Oops..',
    this.detail = 'Unknown error',
  });
}

class CacheException implements Exception {
  final String title;
  final String detail;

  CacheException({
    this.title = 'Oops..',
    this.detail = 'Platform error',
  });
}
