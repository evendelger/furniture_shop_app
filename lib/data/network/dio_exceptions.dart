import 'dart:io';

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String _message;

  String get message => _message;

  DioExceptions.fromDioError(DioException dioError) {
    if (dioError.error is SocketException) {
      _message = "Cannot connect to the server, check your internet connection";
      return;
    }

    switch (dioError.type) {
      case DioExceptionType.cancel:
        _message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        _message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        _message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        _message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        _message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          _message = 'No Internet';
          break;
        }
        _message = "Unexpected error occurred";
        break;
      default:
        _message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }
}
