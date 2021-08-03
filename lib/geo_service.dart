import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoder_offline/geocoder_offline.dart';
import 'package:latlong2/latlong.dart';

part 'geo_service.freezed.dart';
part 'geo_service.g.dart';

const _kBaseUrl = 'http://geoname-lookup.ubuntu.com/';

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

class GeoService {
  GeoService(
    this._geocode, {
    @visibleForTesting Dio? dio,
  }) : _dio = dio ?? Dio();

  final GeocodeData _geocode;
  final Dio _dio;
  CancelToken? _token;

  Future<void> init() async {}

  Future<Iterable<GeoLocation>> searchPoint(LatLng point) async {
    print('search point: $point');
    final results = _geocode.search(point.latitude, point.longitude);
    return results.map(
      (result) => GeoLocation(
        name: result.location.featureName,
        country: result.location.state,
        latitude: result.location.latitude,
        longitude: result.location.longitude,
      ),
    );
  }

  Future<Iterable<GeoLocation>> searchName(
    String name, {
    String? release,
    String? lang,
  }) async {
    print('search name: $name');
    return _cancelQuery()
        .then((_) => _sendQuery(name, release, lang))
        .then(_onQueryResponse)
        .catchError(_onQueryError);
  }

  Future<void> _cancelQuery() async => _token?.cancel();

  Future<Response> _sendQuery(String query, String? release, String? lang) {
    return _dio.get(
      _kBaseUrl,
      queryParameters: <String, String>{
        'query': query,
        if (release != null) 'release': release,
        if (lang != null) 'lang': lang,
      },
      cancelToken: _token = CancelToken(),
      options: Options(responseType: ResponseType.plain),
    );
  }

  Future<Iterable<GeoLocation>> _onQueryError(Object? error) async {
    if (error is DioError && CancelToken.isCancel(error)) {
      print('CANCEL: ${error.message}');
    } else {
      print('TODO: $error');
    }
    return <GeoLocation>[];
  }

  Future<Iterable<GeoLocation>> _onQueryResponse(Response response) async {
    final items = json.decode(response.data.toString()) as Iterable;
    return items.map((json) => GeoLocation.fromJson(json));
  }
}
