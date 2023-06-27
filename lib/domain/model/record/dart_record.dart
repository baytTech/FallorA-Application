import 'package:freezed_annotation/freezed_annotation.dart';

part 'dart_record.freezed.dart';

@freezed
class DartRecord<Param1,Param2> with _$DartRecord {
  factory DartRecord(
    Param1 param1,
    Param2 param2
  ) = _DartRecord;
}