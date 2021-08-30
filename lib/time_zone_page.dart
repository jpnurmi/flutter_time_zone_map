import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import 'geo_service.dart';
import 'time_zone_model.dart';

class FakeLocalizations {
  String geoLocationFormat(String city, String country) => '$city ($country)';
}

final lang = FakeLocalizations();

class TimeZonePage extends StatefulWidget {
  const TimeZonePage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    final service = Provider.of<GeoService>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => TimeZoneModel(service),
      child: const TimeZonePage(),
    );
  }

  @override
  State<TimeZonePage> createState() => _TimeZonePageState();
}

class _TimeZonePageState extends State<TimeZonePage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TimeZoneModel>(context);

    String geoLocationToString(GeoLocation? location) {
      if (location == null) return '';
      return lang.geoLocationFormat(
          location.name ?? '', location.country ?? '');
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Time Zone')),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: FlutterMap(
                options: MapOptions(
                  zoom: 1.0,
                  interactiveFlags: InteractiveFlag.none,
                  onTap: (point) => model
                      .searchPoint(point)
                      .then((_) => model.selectFirstLocation()),
                  screenSize: const Size(10 * 1167.0, 10 * 1071.0),
                  bounds: LatLngBounds(LatLng(-90, -180), LatLng(90, 180)),
                  adaptiveBoundaries: false,
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        point: model.selectedPoint,
                        builder: (ctx) =>
                            const Icon(Icons.place, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Autocomplete<GeoLocation>(
                displayStringForOption: geoLocationToString,
                fieldViewBuilder:
                    (context, controller, focusNode, onSubmitted) {
                  if (model.selectedLocation != null) {
                    controller.text =
                        geoLocationToString(model.selectedLocation);
                  }
                  return TextFormField(
                    autofocus: true,
                    focusNode: focusNode,
                    controller: controller,
                    onFieldSubmitted: (value) => onSubmitted(),
                    onChanged: model.searchName,
                  );
                },
                optionsBuilder: (value) {
                  final name = value.text.toLowerCase();
                  return model.locations.where((location) {
                    return location.name?.toLowerCase().contains(name) == true;
                  });
                },
                onSelected: (location) => model.selectLocation(location),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
