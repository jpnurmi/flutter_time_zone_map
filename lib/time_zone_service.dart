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
        .then((response) => _onLookupResponse(response))
        .catchError((error) => _onLookupError(error));
  }

  Future<void> _cancelLookup() async => _token?.cancel();

  static String _lookupUrl(String query, String? release, String? lang) {
    return <String>[
      _kBaseUrl,
      '?query=$query',
      if (release != null) '&release=$release',
      if (lang != null) '&lang=$lang',
    ].join();
  }

  Future<dio.Response> _doLookup(String query, String? release, String? lang) {
    return _dio.get(
      _lookupUrl(query, release, lang),
      cancelToken: _token = dio.CancelToken(),
      options: dio.Options(responseType: dio.ResponseType.plain),
    );
  }

  Future<Iterable<GeoLocation>> _onLookupError(dio.DioError error) async {
    if (dio.CancelToken.isCancel(error)) {
      print('CANCEL: ${error.message}');
    } else {
      print('TODO: ${error.message}');
    }
    return <GeoLocation>[];
  }

  Future<Iterable<GeoLocation>> _onLookupResponse(dio.Response response) async {
    final items = json.decode(response.data.toString()) as Iterable;
    return items.map((json) => GeoLocation.fromJson(json));
  }
}
