# Urban Dictionary API (Unofficial)

This package provides basic API interface to Urban Dictionary. You can fetch specific definitions or
get list of random word definitions.

You can use either official (internal) API or RapidAPI endpoint.

```dart
final officialClient = OfficialUrbanDictionaryClient();
final rapidApiClient = RapidApiUrbanDictionaryClient(key: 'YOUR_API_KEY');

final client = UrbanDictionary(client: officialClient);
```

To define specific word use `define(String query)` method.

```dart
client.define('wiseguy').then((response) {
  print(response);
});
```

To get list of random word definitions use `random()`.

```dart
client.random().then((response) {
  print(response);
});
```
