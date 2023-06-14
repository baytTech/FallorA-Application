// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'birth_date_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BirthDateResponse _$BirthDateResponseFromJson(Map<String, dynamic> json) {
  return _BirthDateResponse.fromJson(json);
}

/// @nodoc
mixin _$BirthDateResponse {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BirthDateResponseCopyWith<$Res> {
  factory $BirthDateResponseCopyWith(
          BirthDateResponse value, $Res Function(BirthDateResponse) then) =
      _$BirthDateResponseCopyWithImpl<$Res, BirthDateResponse>;
}

/// @nodoc
class _$BirthDateResponseCopyWithImpl<$Res, $Val extends BirthDateResponse>
    implements $BirthDateResponseCopyWith<$Res> {
  _$BirthDateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BirthDateResponseCopyWith<$Res> {
  factory _$$_BirthDateResponseCopyWith(_$_BirthDateResponse value,
          $Res Function(_$_BirthDateResponse) then) =
      __$$_BirthDateResponseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_BirthDateResponseCopyWithImpl<$Res>
    extends _$BirthDateResponseCopyWithImpl<$Res, _$_BirthDateResponse>
    implements _$$_BirthDateResponseCopyWith<$Res> {
  __$$_BirthDateResponseCopyWithImpl(
      _$_BirthDateResponse _value, $Res Function(_$_BirthDateResponse) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_BirthDateResponse implements _BirthDateResponse {
  const _$_BirthDateResponse();

  factory _$_BirthDateResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BirthDateResponseFromJson(json);

  @override
  String toString() {
    return 'BirthDateResponse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_BirthDateResponse);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_BirthDateResponseToJson(
      this,
    );
  }
}

abstract class _BirthDateResponse implements BirthDateResponse {
  const factory _BirthDateResponse() = _$_BirthDateResponse;

  factory _BirthDateResponse.fromJson(Map<String, dynamic> json) =
      _$_BirthDateResponse.fromJson;
}
