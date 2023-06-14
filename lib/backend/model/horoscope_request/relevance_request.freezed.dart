// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'relevance_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HoroscopeRelevanceRequest _$HoroscopeRelevanceRequestFromJson(
    Map<String, dynamic> json) {
  return _HoroscopeRelevanceRequest.fromJson(json);
}

/// @nodoc
mixin _$HoroscopeRelevanceRequest {
  String get sign1 => throw _privateConstructorUsedError;
  String get sign2 => throw _privateConstructorUsedError;
  String get gender1 => throw _privateConstructorUsedError;
  String get gender2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HoroscopeRelevanceRequestCopyWith<HoroscopeRelevanceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoroscopeRelevanceRequestCopyWith<$Res> {
  factory $HoroscopeRelevanceRequestCopyWith(HoroscopeRelevanceRequest value,
          $Res Function(HoroscopeRelevanceRequest) then) =
      _$HoroscopeRelevanceRequestCopyWithImpl<$Res, HoroscopeRelevanceRequest>;
  @useResult
  $Res call({String sign1, String sign2, String gender1, String gender2});
}

/// @nodoc
class _$HoroscopeRelevanceRequestCopyWithImpl<$Res,
        $Val extends HoroscopeRelevanceRequest>
    implements $HoroscopeRelevanceRequestCopyWith<$Res> {
  _$HoroscopeRelevanceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sign1 = null,
    Object? sign2 = null,
    Object? gender1 = null,
    Object? gender2 = null,
  }) {
    return _then(_value.copyWith(
      sign1: null == sign1
          ? _value.sign1
          : sign1 // ignore: cast_nullable_to_non_nullable
              as String,
      sign2: null == sign2
          ? _value.sign2
          : sign2 // ignore: cast_nullable_to_non_nullable
              as String,
      gender1: null == gender1
          ? _value.gender1
          : gender1 // ignore: cast_nullable_to_non_nullable
              as String,
      gender2: null == gender2
          ? _value.gender2
          : gender2 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HoroscopeRelevanceRequestCopyWith<$Res>
    implements $HoroscopeRelevanceRequestCopyWith<$Res> {
  factory _$$_HoroscopeRelevanceRequestCopyWith(
          _$_HoroscopeRelevanceRequest value,
          $Res Function(_$_HoroscopeRelevanceRequest) then) =
      __$$_HoroscopeRelevanceRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sign1, String sign2, String gender1, String gender2});
}

/// @nodoc
class __$$_HoroscopeRelevanceRequestCopyWithImpl<$Res>
    extends _$HoroscopeRelevanceRequestCopyWithImpl<$Res,
        _$_HoroscopeRelevanceRequest>
    implements _$$_HoroscopeRelevanceRequestCopyWith<$Res> {
  __$$_HoroscopeRelevanceRequestCopyWithImpl(
      _$_HoroscopeRelevanceRequest _value,
      $Res Function(_$_HoroscopeRelevanceRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sign1 = null,
    Object? sign2 = null,
    Object? gender1 = null,
    Object? gender2 = null,
  }) {
    return _then(_$_HoroscopeRelevanceRequest(
      sign1: null == sign1
          ? _value.sign1
          : sign1 // ignore: cast_nullable_to_non_nullable
              as String,
      sign2: null == sign2
          ? _value.sign2
          : sign2 // ignore: cast_nullable_to_non_nullable
              as String,
      gender1: null == gender1
          ? _value.gender1
          : gender1 // ignore: cast_nullable_to_non_nullable
              as String,
      gender2: null == gender2
          ? _value.gender2
          : gender2 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HoroscopeRelevanceRequest implements _HoroscopeRelevanceRequest {
  const _$_HoroscopeRelevanceRequest(
      {required this.sign1,
      required this.sign2,
      required this.gender1,
      required this.gender2});

  factory _$_HoroscopeRelevanceRequest.fromJson(Map<String, dynamic> json) =>
      _$$_HoroscopeRelevanceRequestFromJson(json);

  @override
  final String sign1;
  @override
  final String sign2;
  @override
  final String gender1;
  @override
  final String gender2;

  @override
  String toString() {
    return 'HoroscopeRelevanceRequest(sign1: $sign1, sign2: $sign2, gender1: $gender1, gender2: $gender2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HoroscopeRelevanceRequest &&
            (identical(other.sign1, sign1) || other.sign1 == sign1) &&
            (identical(other.sign2, sign2) || other.sign2 == sign2) &&
            (identical(other.gender1, gender1) || other.gender1 == gender1) &&
            (identical(other.gender2, gender2) || other.gender2 == gender2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sign1, sign2, gender1, gender2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HoroscopeRelevanceRequestCopyWith<_$_HoroscopeRelevanceRequest>
      get copyWith => __$$_HoroscopeRelevanceRequestCopyWithImpl<
          _$_HoroscopeRelevanceRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HoroscopeRelevanceRequestToJson(
      this,
    );
  }
}

abstract class _HoroscopeRelevanceRequest implements HoroscopeRelevanceRequest {
  const factory _HoroscopeRelevanceRequest(
      {required final String sign1,
      required final String sign2,
      required final String gender1,
      required final String gender2}) = _$_HoroscopeRelevanceRequest;

  factory _HoroscopeRelevanceRequest.fromJson(Map<String, dynamic> json) =
      _$_HoroscopeRelevanceRequest.fromJson;

  @override
  String get sign1;
  @override
  String get sign2;
  @override
  String get gender1;
  @override
  String get gender2;
  @override
  @JsonKey(ignore: true)
  _$$_HoroscopeRelevanceRequestCopyWith<_$_HoroscopeRelevanceRequest>
      get copyWith => throw _privateConstructorUsedError;
}
