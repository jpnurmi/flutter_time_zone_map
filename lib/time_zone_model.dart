import 'package:flutter/foundation.dart';

import 'time_zone_service.dart';
import 'geo_location.dart';

class TimeZoneModel extends ChangeNotifier {
  TimeZoneModel(this._service);

  final TimeZoneService _service;

  String? lang;
  String? release;

  String? lastQuery;
  GeoLocation? _selectedLocation;
  var _locations = const Iterable<GeoLocation>.empty();

  GeoLocation? get selectedLocation => _selectedLocation;
  void selectLocation(GeoLocation location) {
    if (_selectedLocation == location) return;
    _selectedLocation = location;
    notifyListeners();
  }

  Iterable<GeoLocation> get locations => _locations;
  void _updateLocations(Iterable<GeoLocation> locations) {
    _locations = locations;
    notifyListeners();
  }

  Future<void> lookup(String query) async {
    if (lastQuery == query) return;
    lastQuery = query;
    return _service
        .lookupLocations(query, lang: lang, release: release)
        .then(_updateLocations);
  }
}
