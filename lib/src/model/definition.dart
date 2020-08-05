import 'package:json_annotation/json_annotation.dart';

part 'definition.g.dart';

String _dateToJson(DateTime input) => input.toIso8601String();

DateTime _dateFromJson(String input) => DateTime.parse(input);

@JsonSerializable()
class Definition {
  final String word;

  final String definition;

  @JsonKey(name: 'defid')
  final int id;

  final String permalink;

  @JsonKey(name: 'sounds_urls')
  final Map<String, dynamic> soundsUrls;

  final String author;

  @JsonKey(name: 'written_on', fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime writtenOn;

  final String example;

  @JsonKey(name: 'thumbs_up')
  final int thumbsUp;

  @JsonKey(name: 'thumbs_down')
  final int thumbsDown;

  @JsonKey(name: 'current_vote')
  final String currentVote;

  Definition({
    this.word,
    this.definition,
    this.id,
    this.permalink,
    this.soundsUrls,
    this.author,
    this.writtenOn,
    this.example,
    this.thumbsUp,
    this.thumbsDown,
    this.currentVote,
  });

  @override
  String toString() {
    return 'Definition{word: $word, id: $id, writtenOn: $writtenOn}';
  }

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Definition &&
          runtimeType == other.runtimeType &&
          word == other.word &&
          definition == other.definition &&
          id == other.id &&
          permalink == other.permalink &&
          soundsUrls == other.soundsUrls &&
          author == other.author &&
          writtenOn == other.writtenOn &&
          example == other.example &&
          thumbsUp == other.thumbsUp &&
          thumbsDown == other.thumbsDown &&
          currentVote == other.currentVote;

  @override
  int get hashCode =>
      word.hashCode ^
      definition.hashCode ^
      id.hashCode ^
      permalink.hashCode ^
      soundsUrls.hashCode ^
      author.hashCode ^
      writtenOn.hashCode ^
      example.hashCode ^
      thumbsUp.hashCode ^
      thumbsDown.hashCode ^
      currentVote.hashCode;
}
