import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:urbandictionary/src/model/client.dart';
import 'package:urbandictionary/src/model/definition.dart';
import 'package:urbandictionary/src/model/exception.dart';

export 'src/model/definition.dart';
export 'src/model/client.dart';

/// Urban Dictionary API instance.
///
/// Note that fetch methods might throw. Possible exceptions are
/// [InvalidDataException] (cannot parse data) and [InvalidResponseException]
/// (server does not returns data).
class UrbanDictionary {
  final UrbanDictionaryClient client;
  final Dio _dio;

  UrbanDictionary({@required this.client})
      : _dio = Dio(client.options),
        assert(client != null);

  /// Get definition for given [query].
  Future<List<Definition>> define(String query) async {
    Response response;

    try {
      response = await _dio.get(
        '/define',
        queryParameters: {'term': query},
      );
    } catch (e) {
      throw InvalidResponseException(e.toString());
    }

    try {
      final raw = response.data['list'] as List<dynamic>;
      return raw.map((e) => Definition.fromJson(e)).toList();
    } catch (e) {
      throw const InvalidDataException();
    }
  }

  /// Get list of random word definitions.
  Future<List<Definition>> random() async {
    Response response;

    try {
      response = await _dio.get('/random');
    } catch (e) {
      throw InvalidResponseException(e.toString());
    }

    try {
      final raw = response.data['list'] as List<dynamic>;
      return raw.map((e) => Definition.fromJson(e)).toList();
    } catch (e) {
      throw const InvalidDataException();
    }
  }
}
