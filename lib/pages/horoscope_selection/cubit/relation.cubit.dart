import 'package:fallora/backend/model/horoscope/horoscope_selectable.dart';
import 'package:fallora/backend/model/gender/gender_selectable.dart';
import 'package:fallora/domain/model/record/dart_record.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef DartRecordRelations = DartRecord<GenderSelectableItem?,HoroscopeSelectableItem?>;

class HoroscopeRelationState {
  final DartRecordRelations? prop1;
  final DartRecordRelations? prop2;

  HoroscopeRelationState({this.prop1, this.prop2});
}

class HoroscopeRelationCubit extends Cubit<HoroscopeRelationState> {
  HoroscopeRelationCubit() : super(HoroscopeRelationState());

  void setProp1(DartRecordRelations newState) {
    emit(
      HoroscopeRelationState(
        prop1: newState,
        prop2: state.prop2
      )
    );
  }

   void setProp2(DartRecordRelations newState) {
    emit(
      HoroscopeRelationState(
        prop1: state.prop1,
        prop2: newState
      )
    );
  }
}