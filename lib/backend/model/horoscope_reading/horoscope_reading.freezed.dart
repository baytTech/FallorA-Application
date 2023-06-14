// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'horoscope_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HoroscopeReading _$HoroscopeReadingFromJson(Map<String, dynamic> json) {
  return _HoroscopeReading.fromJson(json);
}

/// @nodoc
mixin _$HoroscopeReading {
  String get id => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  String get sign => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HoroscopeReadingCopyWith<HoroscopeReading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoroscopeReadingCopyWith<$Res> {
  factory $HoroscopeReadingCopyWith(
          HoroscopeReading value, $Res Function(HoroscopeReading) then) =
      _$HoroscopeReadingCopyWithImpl<$Res, HoroscopeReading>;
  @useResult
  $Res call({String id, String data, String sign});
}

/// @nodoc
class _$HoroscopeReadingCopyWithImpl<$Res, $Val extends HoroscopeReading>
    implements $HoroscopeReadingCopyWith<$Res> {
  _$HoroscopeReadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
    Object? sign = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      sign: null == sign
          ? _value.sign
          : sign // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HoroscopeReadingCopyWith<$Res>
    implements $HoroscopeReadingCopyWith<$Res> {
  factory _$$_HoroscopeReadingCopyWith(
          _$_HoroscopeReading value, $Res Function(_$_HoroscopeReading) then) =
      __$$_HoroscopeReadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String data, String sign});
}

/// @nodoc
class __$$_HoroscopeReadingCopyWithImpl<$Res>
    extends _$HoroscopeReadingCopyWithImpl<$Res, _$_HoroscopeReading>
    implements _$$_HoroscopeReadingCopyWith<$Res> {
  __$$_HoroscopeReadingCopyWithImpl(
      _$_HoroscopeReading _value, $Res Function(_$_HoroscopeReading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
    Object? sign = null,
  }) {
    return _then(_$_HoroscopeReading(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      sign: null == sign
          ? _value.sign
          : sign // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HoroscopeReading implements _HoroscopeReading {
  const _$_HoroscopeReading(
      {required this.id, required this.data, required this.sign});

  factory _$_HoroscopeReading.fromJson(Map<String, dynamic> json) =>
      _$$_HoroscopeReadingFromJson(json);

  @override
  final String id;
  @override
  final String data;
  @override
  final String sign;

  @override
  String toString() {
    return 'HoroscopeReading(id: $id, data: $data, sign: $sign)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HoroscopeReading &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.sign, sign) || other.sign == sign));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, data, sign);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HoroscopeReadingCopyWith<_$_HoroscopeReading> get copyWith =>
      __$$_HoroscopeReadingCopyWithImpl<_$_HoroscopeReading>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HoroscopeReadingToJson(
      this,
    );
  }
}

abstract class _HoroscopeReading implements HoroscopeReading {
  const factory _HoroscopeReading(
      {required final String id,
      required final String data,
      required final String sign}) = _$_HoroscopeReading;

  factory _HoroscopeReading.fromJson(Map<String, dynamic> json) =
      _$_HoroscopeReading.fromJson;

  @override
  String get id;
  @override
  String get data;
  @override
  String get sign;
  @override
  @JsonKey(ignore: true)
  _$$_HoroscopeReadingCopyWith<_$_HoroscopeReading> get copyWith =>
      throw _privateConstructorUsedError;
}
