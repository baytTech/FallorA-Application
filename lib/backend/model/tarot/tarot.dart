import 'package:freezed_annotation/freezed_annotation.dart';
part 'tarot.g.dart';
part 'tarot.freezed.dart';

@freezed
class Tarot with _$Tarot {
  const factory Tarot({
    required String id,
    required String title,
    required String data,
    required String imageUrl,
    required String last,
  }) = _Tarot;

  factory Tarot.fromJson(Map<String, Object?> json)
      => _$TarotFromJson(json);
}