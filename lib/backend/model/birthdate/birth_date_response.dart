import 'package:freezed_annotation/freezed_annotation.dart';

part 'birth_date_response.g.dart';
part 'birth_date_response.freezed.dart';

@freezed
class BirthDateResponse with _$BirthDateResponse{
  const factory BirthDateResponse() = _BirthDateResponse;

  factory BirthDateResponse.fromJson(Map<String, Object?> json)
      => _$BirthDateResponseFromJson(json);
}