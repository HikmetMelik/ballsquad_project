import 'dart:io';
import 'package:ballsquad_project/product/base/constants/app_constants.dart';
import 'package:dio/dio.dart';
import '../../../exports.dart';

abstract class AuthorsRepo {
  Future<Authors> getAuthors(String value);
}

final class SampleAuthorsRepo implements AuthorsRepo {
  final baseUrl = AppConstants.baseUrl;
  late final Dio _dio;
  SampleAuthorsRepo() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }

  @override
  Future<Authors> getAuthors(String value) async {
    try {
      final response = await _dio.get(value);
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        final Authors authors = Authors.fromJson(data);
        return authors;
      } else {
        throw NetworkError(AppConstants.errorMessage);
      }
    } catch (error) {
      throw NetworkError('Error: $error');
    }
  }
}

final class NetworkError implements Exception {
  final String message;
  NetworkError(this.message);
}
