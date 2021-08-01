// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'geo_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) {
  return _GeoLocation.fromJson(json);
}

/// @nodoc
class _$GeoLocationTearOff {
  const _$GeoLocationTearOff();

  _GeoLocation call(
      {String? name,
      String? admin1,
      String? country,
      @JsonKey(fromJson: double.tryParse) double? longitude,
      @JsonKey(fromJson: double.tryParse) double? latitude}) {
    return _GeoLocation(
      name: name,
      admin1: admin1,
      country: country,
      longitude: longitude,
      latitude: latitude,
    );
  }

  GeoLocation fromJson(Map<String, Object> json) {
    return GeoLocation.fromJson(json);
  }
}

/// @nodoc
const $GeoLocation = _$GeoLocationTearOff();

/// @nodoc
mixin _$GeoLocation {
  String? get name => throw _privateConstructorUsedError;
  String? get admin1 => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(fromJson: double.tryParse)
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(fromJson: double.tryParse)
  double? get latitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoLocationCopyWith<GeoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoLocationCopyWith<$Res> {
  factory $GeoLocationCopyWith(
          GeoLocation value, $Res Function(GeoLocation) then) =
      _$GeoLocationCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      String? admin1,
      String? country,
      @JsonKey(fromJson: double.tryParse) double? longitude,
      @JsonKey(fromJson: double.tryParse) double? latitude});
}

/// @nodoc
class _$GeoLocationCopyWithImpl<$Res> implements $GeoLocationCopyWith<$Res> {
  _$GeoLocationCopyWithImpl(this._value, this._then);

  final GeoLocation _value;
  // ignore: unused_field
  final $Res Function(GeoLocation) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? admin1 = freezed,
    Object? country = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      admin1: admin1 == freezed
          ? _value.admin1
          : admin1 // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$GeoLocationCopyWith<$Res>
    implements $GeoLocationCopyWith<$Res> {
  factory _$GeoLocationCopyWith(
          _GeoLocation value, $Res Function(_GeoLocation) then) =
      __$GeoLocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      String? admin1,
      String? country,
      @JsonKey(fromJson: double.tryParse) double? longitude,
      @JsonKey(fromJson: double.tryParse) double? latitude});
}

/// @nodoc
class __$GeoLocationCopyWithImpl<$Res> extends _$GeoLocationCopyWithImpl<$Res>
    implements _$GeoLocationCopyWith<$Res> {
  __$GeoLocationCopyWithImpl(
      _GeoLocation _value, $Res Function(_GeoLocation) _then)
      : super(_value, (v) => _then(v as _GeoLocation));

  @override
  _GeoLocation get _value => super._value as _GeoLocation;

  @override
  $Res call({
    Object? name = freezed,
    Object? admin1 = freezed,
    Object? country = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
  }) {
    return _then(_GeoLocation(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      admin1: admin1 == freezed
          ? _value.admin1
          : admin1 // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeoLocation implements _GeoLocation {
  _$_GeoLocation(
      {this.name,
      this.admin1,
      this.country,
      @JsonKey(fromJson: double.tryParse) this.longitude,
      @JsonKey(fromJson: double.tryParse) this.latitude});

  factory _$_GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$$_GeoLocationFromJson(json);

  @override
  final String? name;
  @override
  final String? admin1;
  @override
  final String? country;
  @override
  @JsonKey(fromJson: double.tryParse)
  final double? longitude;
  @override
  @JsonKey(fromJson: double.tryParse)
  final double? latitude;

  @override
  String toString() {
    return 'GeoLocation(name: $name, admin1: $admin1, country: $country, longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeoLocation &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.admin1, admin1) ||
                const DeepCollectionEquality().equals(other.admin1, admin1)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(admin1) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(latitude);

  @JsonKey(ignore: true)
  @override
  _$GeoLocationCopyWith<_GeoLocation> get copyWith =>
      __$GeoLocationCopyWithImpl<_GeoLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoLocationToJson(this);
  }
}

abstract class _GeoLocation implements GeoLocation {
  factory _GeoLocation(
      {String? name,
      String? admin1,
      String? country,
      @JsonKey(fromJson: double.tryParse) double? longitude,
      @JsonKey(fromJson: double.tryParse) double? latitude}) = _$_GeoLocation;

  factory _GeoLocation.fromJson(Map<String, dynamic> json) =
      _$_GeoLocation.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get admin1 => throw _privateConstructorUsedError;
  @override
  String? get country => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: double.tryParse)
  double? get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: double.tryParse)
  double? get latitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GeoLocationCopyWith<_GeoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
