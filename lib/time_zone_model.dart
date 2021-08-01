import 'package:flutter/foundation.dart';

import 'time_zone_service.dart';

class TimeZoneModel extends ChangeNotifier {
  TimeZoneModel(this._service);

  final TimeZoneService _service;
}
