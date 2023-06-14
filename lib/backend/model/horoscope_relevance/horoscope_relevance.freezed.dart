// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'horoscope_relevance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HoroscopeRelevance _$HoroscopeRelevanceFromJson(Map<String, dynamic> json) {
  return _HoroscopeRelevance.fromJson(json);
}

/// @nodoc
mixin _$HoroscopeRelevance {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HoroscopeRelevanceCopyWith<HoroscopeRelevance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoroscopeRelevanceCopyWith<$Res> {
  factory $HoroscopeRelevanceCopyWith(
          HoroscopeRelevance value, $Res Function(HoroscopeRelevance) then) =
      _$HoroscopeRelevanceCopyWithImpl<$Res, HoroscopeRelevance>;
  @useResult
  $Res call({String title, String content, String score});
}

/// @nodoc
class _$HoroscopeRelevanceCopyWithImpl<$Res, $Val extends HoroscopeRelevance>
    implements $HoroscopeRelevanceCopyWith<$Res> {
  _$HoroscopeRelevanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HoroscopeRelevanceCopyWith<$Res>
    implements $HoroscopeRelevanceCopyWith<$Res> {
  factory _$$_HoroscopeRelevanceCopyWith(_$_HoroscopeRelevance value,
          $Res Function(_$_HoroscopeRelevance) then) =
      __$$_HoroscopeRelevanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content, String score});
}

/// @nodoc
class __$$_HoroscopeRelevanceCopyWithImpl<$Res>
    extends _$HoroscopeRelevanceCopyWithImpl<$Res, _$_HoroscopeRelevance>
    implements _$$_HoroscopeRelevanceCopyWith<$Res> {
  __$$_HoroscopeRelevanceCopyWithImpl(
      _$_HoroscopeRelevance _value, $Res Function(_$_HoroscopeRelevance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? score = null,
  }) {
    return _then(_$_HoroscopeRelevance(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HoroscopeRelevance implements _HoroscopeRelevance {
  const _$_HoroscopeRelevance(
      {required this.title, required this.content, required this.score});

  factory _$_HoroscopeRelevance.fromJson(Map<String, dynamic> json) =>
      _$$_HoroscopeRelevanceFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final String score;

  @override
  String toString() {
    return 'HoroscopeRelevance(title: $title, content: $content, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HoroscopeRelevance &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HoroscopeRelevanceCopyWith<_$_HoroscopeRelevance> get copyWith =>
      __$$_HoroscopeRelevanceCopyWithImpl<_$_HoroscopeRelevance>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HoroscopeRelevanceToJson(
      this,
    );
  }
}

abstract class _HoroscopeRelevance implements HoroscopeRelevance {
  const factory _HoroscopeRelevance(
      {required final String title,
      required final String content,
      required final String score}) = _$_HoroscopeRelevance;

  factory _HoroscopeRelevance.fromJson(Map<String, dynamic> json) =
      _$_HoroscopeRelevance.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  String get score;
  @override
  @JsonKey(ignore: true)
  _$$_HoroscopeRelevanceCopyWith<_$_HoroscopeRelevance> get copyWith =>
      throw _privateConstructorUsedError;
}
