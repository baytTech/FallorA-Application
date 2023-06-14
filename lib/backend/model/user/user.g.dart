// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      email: json['email'] as String,
      uid: json['uid'] as String,
      fullName: json['fullName'] as String,
      emailVerified: json['emailVerified'] as bool,
      appPoint: (json['appPoint'] as num).toDouble(),
      birthDate: json['birthDate'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'uid': instance.uid,
      'fullName': instance.fullName,
      'emailVerified': instance.emailVerified,
      'appPoint': instance.appPoint,
      'birthDate': instance.birthDate,
      'phoneNumber': instance.phoneNumber,
    };
