// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fortune.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Fortune _$FortuneFromJson(Map<String, dynamic> json) {
  return _Fortune.fromJson(json);
}

/// @nodoc
mixin _$Fortune {
  String get id => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FortuneCopyWith<Fortune> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FortuneCopyWith<$Res> {
  factory $FortuneCopyWith(Fortune value, $Res Function(Fortune) then) =
      _$FortuneCopyWithImpl<$Res, Fortune>;
  @useResult
  $Res call({String id, String data, int index});
}

/// @nodoc
class _$FortuneCopyWithImpl<$Res, $Val extends Fortune>
    implements $FortuneCopyWith<$Res> {
  _$FortuneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
    Object? index = null,
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
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FortuneCopyWith<$Res> implements $FortuneCopyWith<$Res> {
  factory _$$_FortuneCopyWith(
          _$_Fortune value, $Res Function(_$_Fortune) then) =
      __$$_FortuneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String data, int index});
}

/// @nodoc
class __$$_FortuneCopyWithImpl<$Res>
    extends _$FortuneCopyWithImpl<$Res, _$_Fortune>
    implements _$$_FortuneCopyWith<$Res> {
  __$$_FortuneCopyWithImpl(_$_Fortune _value, $Res Function(_$_Fortune) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
    Object? index = null,
  }) {
    return _then(_$_Fortune(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fortune implements _Fortune {
  const _$_Fortune({required this.id, required this.data, required this.index});

  factory _$_Fortune.fromJson(Map<String, dynamic> json) =>
      _$$_FortuneFromJson(json);

  @override
  final String id;
  @override
  final String data;
  @override
  final int index;

  @override
  String toString() {
    return 'Fortune(id: $id, data: $data, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fortune &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, data, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FortuneCopyWith<_$_Fortune> get copyWith =>
      __$$_FortuneCopyWithImpl<_$_Fortune>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FortuneToJson(
      this,
    );
  }
}

abstract class _Fortune implements Fortune {
  const factory _Fortune(
      {required final String id,
      required final String data,
      required final int index}) = _$_Fortune;

  factory _Fortune.fromJson(Map<String, dynamic> json) = _$_Fortune.fromJson;

  @override
  String get id;
  @override
  String get data;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_FortuneCopyWith<_$_Fortune> get copyWith =>
      throw _privateConstructorUsedError;
}
