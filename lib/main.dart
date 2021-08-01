import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'time_zone_page.dart';
import 'time_zone_service.dart';

void main() {
  runApp(Provider(
    create: (_) => TimeZoneService(Dio()),
    child: const MaterialApp(home: TimeZonePage()),
  ));
}
