// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Definition _$DefinitionFromJson(Map<String, dynamic> json) {
  return Definition(
    word: json['word'] as String,
    definition: json['definition'] as String,
    id: json['defid'] as int,
    permalink: json['permalink'] as String,
    soundsUrls: json['sounds_urls'] as Map<String, dynamic>,
    author: json['author'] as String,
    writtenOn: _dateFromJson(json['written_on'] as String),
    example: json['example'] as String,
    thumbsUp: json['thumbs_up'] as int,
    thumbsDown: json['thumbs_down'] as int,
    currentVote: json['current_vote'] as String,
  );
}

Map<String, dynamic> _$DefinitionToJson(Definition instance) =>
    <String, dynamic>{
      'word': instance.word,
      'definition': instance.definition,
      'defid': instance.id,
      'permalink': instance.permalink,
      'sounds_urls': instance.soundsUrls,
      'author': instance.author,
      'written_on': _dateToJson(instance.writtenOn),
      'example': instance.example,
      'thumbs_up': instance.thumbsUp,
      'thumbs_down': instance.thumbsDown,
      'current_vote': instance.currentVote,
    };
