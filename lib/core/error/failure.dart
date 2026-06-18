import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  final String userMessage;
  final int? statusCode;

  const Failure({
    required this.message,
    required this.userMessage,
    this.statusCode,
  });

  bool get canRetry => true;
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    required super.userMessage,
    super.statusCode,
  });

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionError:
        return const ServerFailure(
          message: "DioExceptionType.connectionError",
          userMessage: "No internet connection, please check your settings.",
        );
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
          message: "DioExceptionType.timeout",
          userMessage: "Connection timed out, please try again.",
        );
      case DioExceptionType.cancel:
        return const ServerFailure(
          message: "DioExceptionType.cancel",
          userMessage: "Request was cancelled, please try again.",
        );
      case DioExceptionType.badResponse:
        return _handleBadResponse(dioError.response?.statusCode);
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          return const ServerFailure(
            message: "SocketException — no internet",
            userMessage: "No internet connection, please check your settings.",
          );
        }
        return const ServerFailure(
          message: "DioExceptionType.unknown",
          userMessage: "Something went wrong, please try again.",
        );
      default:
        return const ServerFailure(
          message: "DioException unknown type",
          userMessage: "Something went wrong, please try again.",
        );
    }
  }

  static ServerFailure _handleBadResponse(int? statusCode) {
    return switch (statusCode) {
      400 => const ServerFailure(
          message: "Bad request. statusCode: 400",
          userMessage: "Something went wrong, please try again.",
          statusCode: 400,
        ),
      401 => const ServerFailure(
          message: "Unauthorized. statusCode: 401",
          userMessage: "Your session expired, please login again.",
          statusCode: 401,
        ),
      403 => const ServerFailure(
          message: "Forbidden. statusCode: 403",
          userMessage: "You don't have access to this content.",
          statusCode: 403,
        ),
      404 => const ServerFailure(
          message: "Not found. statusCode: 404",
          userMessage: "Content not found.",
          statusCode: 404,
        ),
      500 => const ServerFailure(
          message: "Internal server error. statusCode: 500",
          userMessage: "Server is having issues, please try later.",
          statusCode: 500,
        ),
      503 => const ServerFailure(
          message: "Service unavailable. statusCode: 503",
          userMessage: "Service is temporarily down, please try later.",
          statusCode: 503,
        ),
      _ => ServerFailure(
          message: "Unknown error. statusCode: $statusCode",
          userMessage: "Something went wrong, please try again.",
          statusCode: statusCode,
        ),
    };
  }

  @override
  bool get canRetry => statusCode != 401 && statusCode != 403;
}

class GeneralFailure extends Failure {
  const GeneralFailure({
    required super.message,
    required super.userMessage,
  });

  factory GeneralFailure.fromException(dynamic error) {
    if (error is TimeoutException) {
      return const GeneralFailure(
        message: "TimeoutException occurred.",
        userMessage: "Connection timed out, please try again.",
      );
    }

    if (error is TypeError) {
      return const GeneralFailure(
        message: "TypeError — data casting failed.",
        userMessage: "Something went wrong, please try again.",
      );
    }

    if (error is FormatException) {
      return const GeneralFailure(
        message: "FormatException — JSON parsing failed.",
        userMessage: "Something went wrong, please try again.",
      );
    }

    final errorText = error.toString();

    if (errorText.contains('Unable to load asset')) {
      return const GeneralFailure(
        message: "Unable to load asset.",
        userMessage: "Something went wrong, please try again.",
      );
    }

    return GeneralFailure(
      message: "Unexpected error: $errorText",
      userMessage: "An unexpected error occurred, please try again.",
    );
  }
}

class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
    required super.userMessage,
  });

  factory CacheFailure.fromException(dynamic error) {
    if (error is FileSystemException) {
      return const CacheFailure(
        message: "FileSystemException occurred.",
        userMessage: "Local storage error, please restart the app.",
      );
    }

    final errorText = error.toString();

    if (errorText.contains('HiveError') ||
        errorText.contains('BoxNotOpenError')) {
      return const CacheFailure(
        message: "HiveError occurred.",
        userMessage: "Database error, please restart the app.",
      );
    }

    if (errorText.contains('SharedPreferences') ||
        errorText.contains('PlatformException')) {
      return const CacheFailure(
        message: "SharedPreferences error occurred.",
        userMessage: "Failed to access saved data, please restart the app.",
      );
    }

    if (errorText.contains('null') || errorText.contains('not found')) {
      return const CacheFailure(
        message: "Cache miss — data not found.",
        userMessage: "No saved data found.",
      );
    }

    return CacheFailure(
      message: "Unexpected cache error: $errorText",
      userMessage: "A local storage error occurred, please restart the app.",
    );
  }

  @override
  bool get canRetry => false;
}
