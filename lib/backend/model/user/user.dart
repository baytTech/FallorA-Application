import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class User with _$User{
  const factory User({
    required String email,
    required String uid,
    required String fullName,
    required bool emailVerified,
    required double appPoint,
    required
    int? birthDate,
    String? phoneNumber
  }) = _User;

  factory User.fromJson(Map<String, Object?> json)
      => _$UserFromJson(json);
}