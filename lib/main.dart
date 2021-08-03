import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder_offline/geocoder_offline.dart';
import 'package:provider/provider.dart';

import 'geo_service.dart';
import 'time_zone_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final geocoder = GeocodeData(
    await rootBundle.loadString('assets/cities15000.txt'),
    'name',
    'country code',
    'latitude',
    'longitude',
    fieldDelimiter: '\t',
    eol: '\n',
  );

  runApp(Provider(
    create: (_) => GeoService(geocoder),
    child: const MaterialApp(home: Builder(builder: TimeZonePage.create)),
  ));
}
