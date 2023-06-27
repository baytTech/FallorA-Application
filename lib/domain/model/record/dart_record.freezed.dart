// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dart_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DartRecord<Param1, Param2> {
  Param1 get param1 => throw _privateConstructorUsedError;
  Param2 get param2 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DartRecordCopyWith<Param1, Param2, DartRecord<Param1, Param2>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DartRecordCopyWith<Param1, Param2, $Res> {
  factory $DartRecordCopyWith(DartRecord<Param1, Param2> value,
          $Res Function(DartRecord<Param1, Param2>) then) =
      _$DartRecordCopyWithImpl<Param1, Param2, $Res,
          DartRecord<Param1, Param2>>;
  @useResult
  $Res call({Param1 param1, Param2 param2});
}

/// @nodoc
class _$DartRecordCopyWithImpl<Param1, Param2, $Res,
        $Val extends DartRecord<Param1, Param2>>
    implements $DartRecordCopyWith<Param1, Param2, $Res> {
  _$DartRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? param1 = freezed,
    Object? param2 = freezed,
  }) {
    return _then(_value.copyWith(
      param1: freezed == param1
          ? _value.param1
          : param1 // ignore: cast_nullable_to_non_nullable
              as Param1,
      param2: freezed == param2
          ? _value.param2
          : param2 // ignore: cast_nullable_to_non_nullable
              as Param2,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DartRecordCopyWith<Param1, Param2, $Res>
    implements $DartRecordCopyWith<Param1, Param2, $Res> {
  factory _$$_DartRecordCopyWith(_$_DartRecord<Param1, Param2> value,
          $Res Function(_$_DartRecord<Param1, Param2>) then) =
      __$$_DartRecordCopyWithImpl<Param1, Param2, $Res>;
  @override
  @useResult
  $Res call({Param1 param1, Param2 param2});
}

/// @nodoc
class __$$_DartRecordCopyWithImpl<Param1, Param2, $Res>
    extends _$DartRecordCopyWithImpl<Param1, Param2, $Res,
        _$_DartRecord<Param1, Param2>>
    implements _$$_DartRecordCopyWith<Param1, Param2, $Res> {
  __$$_DartRecordCopyWithImpl(_$_DartRecord<Param1, Param2> _value,
      $Res Function(_$_DartRecord<Param1, Param2>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? param1 = freezed,
    Object? param2 = freezed,
  }) {
    return _then(_$_DartRecord<Param1, Param2>(
      freezed == param1
          ? _value.param1
          : param1 // ignore: cast_nullable_to_non_nullable
              as Param1,
      freezed == param2
          ? _value.param2
          : param2 // ignore: cast_nullable_to_non_nullable
              as Param2,
    ));
  }
}

/// @nodoc

class _$_DartRecord<Param1, Param2> implements _DartRecord<Param1, Param2> {
  _$_DartRecord(this.param1, this.param2);

  @override
  final Param1 param1;
  @override
  final Param2 param2;

  @override
  String toString() {
    return 'DartRecord<$Param1, $Param2>(param1: $param1, param2: $param2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DartRecord<Param1, Param2> &&
            const DeepCollectionEquality().equals(other.param1, param1) &&
            const DeepCollectionEquality().equals(other.param2, param2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(param1),
      const DeepCollectionEquality().hash(param2));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DartRecordCopyWith<Param1, Param2, _$_DartRecord<Param1, Param2>>
      get copyWith => __$$_DartRecordCopyWithImpl<Param1, Param2,
          _$_DartRecord<Param1, Param2>>(this, _$identity);
}

abstract class _DartRecord<Param1, Param2>
    implements DartRecord<Param1, Param2> {
  factory _DartRecord(final Param1 param1, final Param2 param2) =
      _$_DartRecord<Param1, Param2>;

  @override
  Param1 get param1;
  @override
  Param2 get param2;
  @override
  @JsonKey(ignore: true)
  _$$_DartRecordCopyWith<Param1, Param2, _$_DartRecord<Param1, Param2>>
      get copyWith => throw _privateConstructorUsedError;
}
