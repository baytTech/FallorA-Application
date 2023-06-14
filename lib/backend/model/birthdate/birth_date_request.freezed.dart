// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'birth_date_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BirthDateRequest _$BirthDateRequestFromJson(Map<String, dynamic> json) {
  return _BirthDateRequest.fromJson(json);
}

/// @nodoc
mixin _$BirthDateRequest {
  int? get birthDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BirthDateRequestCopyWith<BirthDateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BirthDateRequestCopyWith<$Res> {
  factory $BirthDateRequestCopyWith(
          BirthDateRequest value, $Res Function(BirthDateRequest) then) =
      _$BirthDateRequestCopyWithImpl<$Res, BirthDateRequest>;
  @useResult
  $Res call({int? birthDate});
}

/// @nodoc
class _$BirthDateRequestCopyWithImpl<$Res, $Val extends BirthDateRequest>
    implements $BirthDateRequestCopyWith<$Res> {
  _$BirthDateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthDate = freezed,
  }) {
    return _then(_value.copyWith(
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BirthDateRequestCopyWith<$Res>
    implements $BirthDateRequestCopyWith<$Res> {
  factory _$$_BirthDateRequestCopyWith(
          _$_BirthDateRequest value, $Res Function(_$_BirthDateRequest) then) =
      __$$_BirthDateRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? birthDate});
}

/// @nodoc
class __$$_BirthDateRequestCopyWithImpl<$Res>
    extends _$BirthDateRequestCopyWithImpl<$Res, _$_BirthDateRequest>
    implements _$$_BirthDateRequestCopyWith<$Res> {
  __$$_BirthDateRequestCopyWithImpl(
      _$_BirthDateRequest _value, $Res Function(_$_BirthDateRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthDate = freezed,
  }) {
    return _then(_$_BirthDateRequest(
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BirthDateRequest implements _BirthDateRequest {
  const _$_BirthDateRequest({this.birthDate});

  factory _$_BirthDateRequest.fromJson(Map<String, dynamic> json) =>
      _$$_BirthDateRequestFromJson(json);

  @override
  final int? birthDate;

  @override
  String toString() {
    return 'BirthDateRequest(birthDate: $birthDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BirthDateRequest &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, birthDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BirthDateRequestCopyWith<_$_BirthDateRequest> get copyWith =>
      __$$_BirthDateRequestCopyWithImpl<_$_BirthDateRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BirthDateRequestToJson(
      this,
    );
  }
}

abstract class _BirthDateRequest implements BirthDateRequest {
  const factory _BirthDateRequest({final int? birthDate}) = _$_BirthDateRequest;

  factory _BirthDateRequest.fromJson(Map<String, dynamic> json) =
      _$_BirthDateRequest.fromJson;

  @override
  int? get birthDate;
  @override
  @JsonKey(ignore: true)
  _$$_BirthDateRequestCopyWith<_$_BirthDateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
