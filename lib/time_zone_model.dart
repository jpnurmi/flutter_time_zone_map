import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

import 'geo_service.dart';

class TimeZoneModel extends ChangeNotifier {
  TimeZoneModel(GeoService service) : _service = service;

  final GeoService _service;

  String? lang;
  String? release;

  String? _lastName;
  LatLng? _lastPoint;
  GeoLocation? _selectedLocation;
  var _locations = const Iterable<GeoLocation>.empty();

  GeoLocation? get selectedLocation => _selectedLocation;
  LatLng get selectedPoint => LatLng(
      _selectedLocation?.latitude ?? 0, _selectedLocation?.longitude ?? 0);

  void selectLocation(GeoLocation? location) {
    if (_selectedLocation == location) return;
    print('select $location');
    _selectedLocation = location;
    _lastName = null;
    _lastPoint = null;
    notifyListeners();
  }

  void selectFirstLocation() => selectLocation(_locations.firstOrNull);

  Iterable<GeoLocation> get locations => _locations;
  void _updateLocations(Iterable<GeoLocation> locations) {
    _locations = locations;
    notifyListeners();
  }

  Future<void> searchName(String name) async {
    if (_lastName == name) return;
    _lastName = name;
    _selectedLocation = null;
    return _service
        .searchName(name, lang: lang, release: release)
        .then(_updateLocations);
  }

  Future<void> searchPoint(LatLng point) async {
    if (_lastPoint == point) return;
    _lastPoint = point;
    _selectedLocation = null;
    return _service.searchPoint(point).then(_updateLocations);
  }
}
