import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Failure {
  final String message;
  final IconData icon;

  const Failure(this.icon, {required this.message});
}

class ServerFailure extends Failure {
  ServerFailure(super.icon, {required super.message});

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionError:
        return ServerFailure(
          Icons.wifi_off,
          message: "Connection failed. Please check your internet connection.",
        );
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          Icons.timer_off,
          message: "Connection timed out. Please try again later.",
        );
      case DioExceptionType.cancel:
        return ServerFailure(Icons.cancel, message: "Request was cancelled.");
      case DioExceptionType.badResponse:
        return _handleBadResponse(dioError.response?.statusCode);
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          return ServerFailure(
            Icons.wifi_off,
            message: "No internet connection. Please check your settings.",
          );
        }
        return ServerFailure(
          Icons.error_outline,
          message: "An unexpected error occurred.",
        );
      default:
        return ServerFailure(
          Icons.error_outline,
          message: "An unknown error occurred. Please try again.",
        );
    }
  }

  // دالة جانبية للتعامل مع أخطاء الـ Status Codes بدون تخزين الرقم
  static ServerFailure _handleBadResponse(int? statusCode) {
    String message;
    switch (statusCode) {
      case 400:
        message = "Bad request. Please check your input.";
      case 401:
        message = "Unauthorized. Please login again.";
      case 403:
        message = "Access forbidden. You don't have permission.";
      case 404:
        message = "Resource not found.";
      case 500:
        message = "Internal server error. Please try later.";
      case 503:
        message = "Service unavailable.";
      default:
        message = "Received an invalid response ($statusCode).";
    }
    return ServerFailure(Icons.error_outline, message: message);
  }
}

class GeneralFailure extends Failure {
  GeneralFailure(super.icon, {required super.message});

  factory GeneralFailure.fromException(dynamic error) {
    if (error is TimeoutException) {
      return GeneralFailure(
        Icons.timer_off,
        message: "Request timed out. Please try again later.",
      );
    }
    String errorText = error.toString();

    if (errorText.contains('Unable to load asset')) {
      return GeneralFailure(
        Icons.document_scanner_outlined,
        message: "Sorry, could not access data files.",
      );
    } else if (errorText.contains('FileSystemException')) {
      return GeneralFailure(
        Icons.storage,
        message: "Local storage error occurred.",
      );
    }

    return GeneralFailure(
      Icons.warning_amber_rounded,
      message: "An unexpected error occurred. Please try again.",
    );
  }
}
