import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

abstract class UrbanDictionaryClient {
  String get baseUrl;

  BaseOptions get options;
}

/// Official internal Urban Dictionary API.
class OfficialUrbanDictionaryClient implements UrbanDictionaryClient {
  @override
  final String baseUrl;

  @override
  final BaseOptions options;

  OfficialUrbanDictionaryClient({
    this.baseUrl = 'http://api.urbandictionary.com/v0',
  }) : options = BaseOptions(
          responseType: ResponseType.json,
          baseUrl: baseUrl,
        );
}

/// Alternative API for accessing Urban Dictionary. Requires registration.
///
/// https://rapidapi.com/community/api/urban-dictionary/
class RapidApiUrbanDictionaryClient extends UrbanDictionaryClient {
  @override
  final String baseUrl;

  @override
  final BaseOptions options;

  /// Create RapidAPI client instance.
  ///
  /// [key] is required. You can obtain one after registration.
  RapidApiUrbanDictionaryClient({
    this.baseUrl = 'https://mashape-community-urban-dictionary.p.rapidapi.com',
    @required String key,
  }) : options = BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'x-rapidapi-host': baseUrl.split('//')[1],
            'x-rapidapi-key': key,
          },
          responseType: ResponseType.json,
        );
}
