# Urban Dictionary API (Unofficial)

This package provides basic API interface to Urban Dictionary. You can fetch specific definition
with `fetchDefinition` call or get random definitions with `fetchRandom`.

```dart
final client = UrbanDictionary();
client.fetchDefinition('wiseguy').then((value) {
  print(value);
});
```
