import 'package:fallora/backend/model/horoscope/horoscope_selectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoroscopeCommentCubit extends Cubit<HoroscopeSelectableItem?> {
  HoroscopeCommentCubit(): super(null);

  HoroscopeSelectableItem? setState(HoroscopeSelectableItem? newState) {
    if(newState == null) return null;
    emit(newState);
    return newState;
  }
}