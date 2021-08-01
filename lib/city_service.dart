import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_service.freezed.dart';

@freezed
class City with _$City {
  factory City({
    required String country,
    required String name,
    required double latitude,
    required double longitude,
  }) = _City;

  factory City._fromLine(String line) {
    final data = line.split('\t');
    return City(
      country: data.value(8),
      name: data.value(2),
      latitude: double.parse(data.value(4)),
      longitude: double.parse(data.value(5)),
    );
  }
}

class CityService {
  CityService({FileSystem fs = const LocalFileSystem()}) : _fs = fs;

  final FileSystem _fs;
  List<City> _cities = <City>[];

  Future<void> read(String filePath) {
    return _fs.file(filePath).readAsLines().then(_parseCities);
  }

  void _parseCities(List<String> lines) {
    _cities = lines.map((line) => City._fromLine(line)).toList();
  }
}

extension StringList on List<String> {
  String value(int index, {String defaultValue = ''}) {
    return valueOrNull(index) ?? defaultValue;
  }

  String? valueOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }
}
