import 'package:urbandictionary/urbandictionary.dart';

void main() {
  final client = UrbanDictionary();
  client.fetchDefinition('egghead').then((value) {
    print(value.first);
  });

//  client.fetchRandom().then((value) {
//    print(value.length);
//  });
}
