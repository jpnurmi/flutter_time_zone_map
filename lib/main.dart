import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'city_service.dart';
import 'geo_service.dart';
import 'time_zone_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => CityService()),
      Provider(create: (_) => GeoService(Dio())),
    ],
    child: const MaterialApp(home: Builder(builder: TimeZonePage.create)),
  ));
}
