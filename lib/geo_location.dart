import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_location.freezed.dart';
part 'geo_location.g.dart';

@freezed
class GeoLocation with _$GeoLocation {
  factory GeoLocation({
    String? name,
    String? admin1,
    String? country,
    @JsonKey(fromJson: double.tryParse) double? longitude,
    @JsonKey(fromJson: double.tryParse) double? latitude,
  }) = _GeoLocation;

  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);
}
