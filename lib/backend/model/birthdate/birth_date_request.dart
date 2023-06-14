import 'package:freezed_annotation/freezed_annotation.dart';

part 'birth_date_request.g.dart';
part 'birth_date_request.freezed.dart';

@freezed
class BirthDateRequest with _$BirthDateRequest{
  const factory BirthDateRequest({
    int? birthDate,
  }) = _BirthDateRequest;

  factory BirthDateRequest.fromJson(Map<String, Object?> json)
      => _$BirthDateRequestFromJson(json);
}