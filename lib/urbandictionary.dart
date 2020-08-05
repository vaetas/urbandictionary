import 'package:dio/dio.dart';
import 'package:urbandictionary/src/model/definition.dart';
import 'package:urbandictionary/src/model/exception.dart';

export 'src/model/definition.dart';

/// Urban Dictionary API instance.
///
/// Note that fetch methods might throw. Possible exceptions are
/// [InvalidDataException] (cannot parse data) and [InvalidResponseException]
/// (server does not returns data).
class UrbanDictionary {
  final _dio = Dio();
  final _url = 'http://api.urbandictionary.com/v0';

  /// Get definition for given [query].
  Future<List<Definition>> fetchDefinition(String query) async {
    Response response;

    try {
      response = await _dio.get(
        '$_url/define',
        queryParameters: {'term': query},
        options: RequestOptions(responseType: ResponseType.json),
      );
    } catch (e) {
      throw const InvalidResponseException();
    }

    try {
      final raw = response.data['list'] as List<dynamic>;
      return raw.map((e) => Definition.fromJson(e)).toList();
    } catch (e) {
      throw const InvalidDataException();
    }
  }

  /// Get list of random word definitions.
  Future<List<Definition>> fetchRandom() async {
    Response response;

    try {
      response = await _dio.get('$_url/random');
    } catch (e) {
      throw const InvalidResponseException();
    }

    try {
      final raw = response.data['list'] as List<dynamic>;
      return raw.map((e) => Definition.fromJson(e)).toList();
    } catch (e) {
      throw const InvalidDataException();
    }
  }
}
