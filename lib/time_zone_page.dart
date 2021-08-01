import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import 'geo_location.dart';
import 'time_zone_model.dart';
import 'time_zone_service.dart';

class TimeZonePage extends StatefulWidget {
  const TimeZonePage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    final service = Provider.of<TimeZoneService>(context, listen: false);
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Zone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Center(
          child: Autocomplete<GeoLocation>(
            initialValue:
                TextEditingValue(text: model.selectedLocation?.name ?? ''),
            displayStringForOption: (location) => location.name ?? '',
            optionsBuilder: (value) {
              model.lookup(value.text);
              return model.locations.where((location) =>
                  location.name
                      ?.toLowerCase()
                      .contains(value.text.toLowerCase()) ==
                  true);
            },
            onSelected: (location) {
              print('selected ${location.name}');
            },
          ),
        ),
      ),
    );
  }
}
