import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'GoogleMapModel.g.dart';

@JsonSerializable()
class GoogleMapModel {
  final String name;
  final double rating;
  final String formatted_address;
  final String international_phone_number;
  final String website;
  final Geometry geometry;
  final CurrentOpeningHours current_opening_hours;
  final EditorialSummary editorial_summary;

  GoogleMapModel(
      {required this.name,
      required this.rating,
      required this.formatted_address,
      required this.geometry,
      required this.current_opening_hours,
      required this.international_phone_number,
      required this.website,
      required this.editorial_summary});

  factory GoogleMapModel.fromJson(Map<String, dynamic> json) =>
      _$GoogleMapModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleMapModelToJson(this);
}

@JsonSerializable()
class Geometry {
  final Location location;

  // final Viewport viewport;
  Geometry({required this.location});

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Location {
  final double lat;
  final double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class CurrentOpeningHours {
  final bool open_now;

  CurrentOpeningHours({required this.open_now});

  factory CurrentOpeningHours.fromJson(Map<String, dynamic> json) =>
      _$CurrentOpeningHoursFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentOpeningHoursToJson(this);
}

@JsonSerializable()
class EditorialSummary {
  final String overview;

  EditorialSummary({required this.overview});

  factory EditorialSummary.fromJson(Map<String, dynamic> json) =>
      _$EditorialSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$EditorialSummaryToJson(this);
}
