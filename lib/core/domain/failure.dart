import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get message => 'Default Failure';
  DioErrorType? get type;
  @override
  List<Object?> get props => [];
}

class GeneralFailure extends Failure {
  @override
  final String message;

  @override
  final DioErrorType? type;

  GeneralFailure(this.message, this.type);

  @override
  List<Object?> get props => [message, type];
}

class GoogleCountryFailure extends Failure {
  @override
  final String message;

  @override
  final DioErrorType? type;

  final bool needCountry;

  GoogleCountryFailure(this.message, this.type, this.needCountry);

  @override
  List<Object?> get props => [message, type, needCountry];
}

class AppleCountryFailure extends Failure {
  @override
  final String message;

  @override
  final DioErrorType? type;

  final String? idToken;

  final bool needCountry;

  AppleCountryFailure(
    this.message,
    this.type, {
    required this.idToken,
    required this.needCountry,
  });

  @override
  List<Object?> get props => [message, type, idToken, needCountry];
}

class EmailVerificationFailure extends Failure {
  @override
  final String message;

  @override
  final DioErrorType? type;

  final String errorType;

  final String? userId;

  final String? idToken;

  final int? timeoutSeconds;

  EmailVerificationFailure(
      {required this.message,
      this.type,
      required this.errorType,
      this.userId,
      this.idToken,
      this.timeoutSeconds});

  @override
  List<Object?> get props =>
      [message, type, errorType, userId, idToken, timeoutSeconds];
}

// Auth Failures
class NoInternetConnectionFailure extends Failure {
  @override
  String get message => 'No Internet connection';
  @override
  DioErrorType get type => DioErrorType.connectTimeout;
}

class CacheFailure extends Failure {
  @override
  String get message => 'Cache Failure';
  @override
  DioErrorType? get type => null;
}
