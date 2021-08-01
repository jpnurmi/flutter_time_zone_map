import 'package:flutter/foundation.dart';

import 'time_zone_service.dart';
import 'geo_location.dart';

class TimeZoneModel extends ChangeNotifier {
  TimeZoneModel(this._service);

  final TimeZoneService _service;

  String? lang;
  String? release;

  Future<Iterable<GeoLocation>> lookup(String query) {
    return _service.lookupLocations(query, lang: lang, release: release);
  }
}
