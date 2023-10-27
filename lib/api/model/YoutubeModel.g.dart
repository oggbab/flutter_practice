// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YoutubeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeModel _$YoutubeModelFromJson(Map<String, dynamic> json) => YoutubeModel(
      snippet: Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
      id: json['id'] as String,
    );

Map<String, dynamic> _$YoutubeModelToJson(YoutubeModel instance) =>
    <String, dynamic>{
      'snippet': instance.snippet,
      'id': instance.id,
    };

Snippet _$SnippetFromJson(Map<String, dynamic> json) => Snippet(
      title: json['title'] as String,
      channelld: json['channelld'] as String,
      description: json['description'] as String,
      thumbnails:
          Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SnippetToJson(Snippet instance) => <String, dynamic>{
      'title': instance.title,
      'channelld': instance.channelld,
      'description': instance.description,
      'thumbnails': instance.thumbnails,
    };

Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) => Thumbnails(
      standard: Standard.fromJson(json['standard'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThumbnailsToJson(Thumbnails instance) =>
    <String, dynamic>{
      'standard': instance.standard,
    };

Standard _$StandardFromJson(Map<String, dynamic> json) => Standard(
      url: json['url'] as String,
    );

Map<String, dynamic> _$StandardToJson(Standard instance) => <String, dynamic>{
      'url': instance.url,
    };
