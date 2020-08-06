import 'package:urbandictionary/urbandictionary.dart';

void main() {
  final client = UrbanDictionary();

  client.define('egghead').then((value) {
    print(value.first);
  });

//  client.fetchRandom().then((value) {
//    print(value.length);
//  });
}
