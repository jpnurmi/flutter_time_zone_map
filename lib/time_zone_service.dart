import 'dart:convert';

import 'package:dio/dio.dart' as dio;

import 'geo_location.dart';

const _kBaseUrl = 'http://geoname-lookup.ubuntu.com/';

class TimeZoneService {
  TimeZoneService(this._dio);

  final dio.Dio _dio;
  dio.CancelToken? _token;

  Future<Iterable<GeoLocation>> lookupLocations(
    String query, {
    String? release,
    String? lang,
  }) async {
    return _cancelLookup()
        .then((_) => _doLookup(query, release, lang))
        .then(_onLookupResponse)
        .catchError(_onLookupError);
  }

  Future<void> _cancelLookup() async => _token?.cancel();

  Future<dio.Response> _doLookup(String query, String? release, String? lang) {
    return _dio.get(
      _kBaseUrl,
      queryParameters: <String, String>{
        'query': query,
        if (release != null) 'release': release,
        if (lang != null) 'lang': lang,
      },
      cancelToken: _token = dio.CancelToken(),
      options: dio.Options(responseType: dio.ResponseType.plain),
    );
  }

  Future<Iterable<GeoLocation>> _onLookupError(Object? error) async {
    if (error is dio.DioError && dio.CancelToken.isCancel(error)) {
      print('CANCEL: ${error.message}');
    } else {
      print('TODO: $error');
    }
    return <GeoLocation>[];
  }

  Future<Iterable<GeoLocation>> _onLookupResponse(dio.Response response) async {
    final items = json.decode(response.data.toString()) as Iterable;
    return items.map((json) => GeoLocation.fromJson(json));
  }
}
