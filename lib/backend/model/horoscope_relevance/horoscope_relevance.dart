
import 'package:freezed_annotation/freezed_annotation.dart';

part 'horoscope_relevance.freezed.dart';
part 'horoscope_relevance.g.dart';


@freezed
class HoroscopeRelevance with _$HoroscopeRelevance {
    const factory HoroscopeRelevance({
    required String title,
    required String content,
    required String score,
  }) = _HoroscopeRelevance;

  factory HoroscopeRelevance.fromJson(Map<String, Object?> json)
      => _$HoroscopeRelevanceFromJson(json);
}