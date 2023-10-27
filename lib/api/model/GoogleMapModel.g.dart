// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GoogleMapModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleMapModel _$GoogleMapModelFromJson(Map<String, dynamic> json) =>
    GoogleMapModel(
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      formatted_address: json['formatted_address'] as String,
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      current_opening_hours: CurrentOpeningHours.fromJson(
          json['current_opening_hours'] as Map<String, dynamic>),
      international_phone_number: json['international_phone_number'] as String,
      website: json['website'] as String,
      editorial_summary: EditorialSummary.fromJson(
          json['editorial_summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoogleMapModelToJson(GoogleMapModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rating': instance.rating,
      'formatted_address': instance.formatted_address,
      'international_phone_number': instance.international_phone_number,
      'website': instance.website,
      'geometry': instance.geometry,
      'current_opening_hours': instance.current_opening_hours,
      'editorial_summary': instance.editorial_summary,
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'location': instance.location,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

CurrentOpeningHours _$CurrentOpeningHoursFromJson(Map<String, dynamic> json) =>
    CurrentOpeningHours(
      open_now: json['open_now'] as bool,
    );

Map<String, dynamic> _$CurrentOpeningHoursToJson(
        CurrentOpeningHours instance) =>
    <String, dynamic>{
      'open_now': instance.open_now,
    };

EditorialSummary _$EditorialSummaryFromJson(Map<String, dynamic> json) =>
    EditorialSummary(
      overview: json['overview'] as String,
    );

Map<String, dynamic> _$EditorialSummaryToJson(EditorialSummary instance) =>
    <String, dynamic>{
      'overview': instance.overview,
    };
