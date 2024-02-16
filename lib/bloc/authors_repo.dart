import 'package:ballsquad_project/bloc/authors.dart';
import 'package:dio/dio.dart';

abstract class AuthorsRepo {
  Future<List<Authors>> getAuthors();
}

class SampleAuthorsRepo implements AuthorsRepo {
  final baseUrl = 'https://openlibrary.org/search/authors.json?q=jack';
  @override
  Future<List<Authors>> getAuthors() async {
    try {
      final dio = Dio();
      final response = await dio.get(baseUrl);

      switch (response.statusCode) {
        case 200:
          final jsonBody = response.data;
          if (jsonBody['docs'] != null) {
            final List<dynamic> docs = jsonBody['docs'];

            final List<Authors> authorsList = docs.map((e) => Authors.fromJson(e)).toList();

            return authorsList;
          } else {
            throw NetworkError('Invalid data format');
          }
        default:
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
