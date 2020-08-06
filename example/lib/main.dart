import 'package:urbandictionary/urbandictionary.dart';

void main() {
//  final client = UrbanDictionary(
//    client: RapidApiUrbanDictionaryClient(
//      key: 'YOUR_API_KEY',
//    ),
//  );

  final client = UrbanDictionary(client: OfficialUrbanDictionaryClient());

  client.define('egghead').then((response) {
    print(response.first);
  });

//  client.random().then((response) {
//    print(response);
//  });
}
