import 'package:flutter/foundation.dart';

import 'geo_service.dart';
import 'city_service.dart';

class TimeZoneModel extends ChangeNotifier {
  TimeZoneModel({
    required CityService cityService,
    required GeoService geoService,
  })  : _cityService = cityService,
        _geoService = geoService;

  final CityService _cityService;
  final GeoService _geoService;

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
    return _geoService
        .lookupLocations(query, lang: lang, release: release)
        .then(_updateLocations);
  }
}
