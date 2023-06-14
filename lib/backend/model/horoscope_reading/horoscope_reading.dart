import 'package:freezed_annotation/freezed_annotation.dart';

part 'horoscope_reading.freezed.dart';
part 'horoscope_reading.g.dart';

@freezed
class HoroscopeReading with _$HoroscopeReading {
  const factory HoroscopeReading({
    required String id,
    required String data,
    required String sign,
  }) = _HoroscopeReading;

  factory HoroscopeReading.fromJson(Map<String, Object?> json)
      => _$HoroscopeReadingFromJson(json);
}