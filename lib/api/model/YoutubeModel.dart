import 'package:json_annotation/json_annotation.dart';

part 'YoutubeModel.g.dart';

@JsonSerializable()
class YoutubeModel {
  final Snippet snippet;
  final String id;

  YoutubeModel({required this.snippet, required this.id});

  factory YoutubeModel.fromJson(Map<String, dynamic> json) =>
      _$YoutubeModelFromJson(json);

  Map<String, dynamic> toJson() => _$YoutubeModelToJson(this);
}

@JsonSerializable()
class Snippet {
  final String title;
  final String channelld;
  final String description;
  final Thumbnails thumbnails;

  Snippet(
      {required this.title,
      required this.channelld,
      required this.description,
      required this.thumbnails});

  factory Snippet.fromJson(Map<String, dynamic> json) =>
      _$SnippetFromJson(json);

  Map<String, dynamic> toJson() => _$SnippetToJson(this);
}

@JsonSerializable()
class Thumbnails {
  final Standard standard;

  Thumbnails({required this.standard});

  factory Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailsToJson(this);
}

@JsonSerializable()
class Standard {
  final String url;

  Standard({required this.url});

  factory Standard.fromJson(Map<String, dynamic> json) =>
      _$StandardFromJson(json);

  Map<String, dynamic> toJson() => _$StandardToJson(this);
}
