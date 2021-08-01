// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeoLocation _$$_GeoLocationFromJson(Map<String, dynamic> json) =>
    _$_GeoLocation(
      name: json['name'] as String?,
      admin1: json['admin1'] as String?,
      country: json['country'] as String?,
      longitude: double.tryParse(json['longitude'] as String),
      latitude: double.tryParse(json['latitude'] as String),
    );

Map<String, dynamic> _$$_GeoLocationToJson(_$_GeoLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'admin1': instance.admin1,
      'country': instance.country,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
