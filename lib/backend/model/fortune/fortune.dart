import 'package:freezed_annotation/freezed_annotation.dart';

part 'fortune.g.dart';
part 'fortune.freezed.dart';

@freezed
class Fortune with _$Fortune {
  const factory Fortune({
    required String id,
    required String data,
    required int index,
  }) = _Fortune;

  factory Fortune.fromJson(Map<String, Object?> json)
      => _$FortuneFromJson(json);
}