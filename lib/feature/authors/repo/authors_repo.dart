import 'dart:io';

import 'package:ballsquad_project/feature/authors/model/authors.dart';
import 'package:dio/dio.dart';

abstract class AuthorsRepo {
  Future<Authors> getAuthors(String value);
}

class SampleAuthorsRepo implements AuthorsRepo {
  final baseUrl = 'https://openlibrary.org/search/authors.json?q=';
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
        throw NetworkError('Failed to fetch authors');
      }
    } catch (error) {
      throw NetworkError('Error: $error');
    }
  }
}

class NetworkError implements Exception {
  final String message;
  NetworkError(this.message);
}
