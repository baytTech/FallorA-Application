// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tarot _$TarotFromJson(Map<String, dynamic> json) {
  return _Tarot.fromJson(json);
}

/// @nodoc
mixin _$Tarot {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get last => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TarotCopyWith<Tarot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TarotCopyWith<$Res> {
  factory $TarotCopyWith(Tarot value, $Res Function(Tarot) then) =
      _$TarotCopyWithImpl<$Res, Tarot>;
  @useResult
  $Res call(
      {String id, String title, String data, String imageUrl, String last});
}

/// @nodoc
class _$TarotCopyWithImpl<$Res, $Val extends Tarot>
    implements $TarotCopyWith<$Res> {
  _$TarotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? data = null,
    Object? imageUrl = null,
    Object? last = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TarotCopyWith<$Res> implements $TarotCopyWith<$Res> {
  factory _$$_TarotCopyWith(_$_Tarot value, $Res Function(_$_Tarot) then) =
      __$$_TarotCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String title, String data, String imageUrl, String last});
}

/// @nodoc
class __$$_TarotCopyWithImpl<$Res> extends _$TarotCopyWithImpl<$Res, _$_Tarot>
    implements _$$_TarotCopyWith<$Res> {
  __$$_TarotCopyWithImpl(_$_Tarot _value, $Res Function(_$_Tarot) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? data = null,
    Object? imageUrl = null,
    Object? last = null,
  }) {
    return _then(_$_Tarot(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tarot implements _Tarot {
  const _$_Tarot(
      {required this.id,
      required this.title,
      required this.data,
      required this.imageUrl,
      required this.last});

  factory _$_Tarot.fromJson(Map<String, dynamic> json) =>
      _$$_TarotFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String data;
  @override
  final String imageUrl;
  @override
  final String last;

  @override
  String toString() {
    return 'Tarot(id: $id, title: $title, data: $data, imageUrl: $imageUrl, last: $last)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tarot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.last, last) || other.last == last));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, data, imageUrl, last);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TarotCopyWith<_$_Tarot> get copyWith =>
      __$$_TarotCopyWithImpl<_$_Tarot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TarotToJson(
      this,
    );
  }
}

abstract class _Tarot implements Tarot {
  const factory _Tarot(
      {required final String id,
      required final String title,
      required final String data,
      required final String imageUrl,
      required final String last}) = _$_Tarot;

  factory _Tarot.fromJson(Map<String, dynamic> json) = _$_Tarot.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get data;
  @override
  String get imageUrl;
  @override
  String get last;
  @override
  @JsonKey(ignore: true)
  _$$_TarotCopyWith<_$_Tarot> get copyWith =>
      throw _privateConstructorUsedError;
}
