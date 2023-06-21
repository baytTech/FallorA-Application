import 'package:fallora/backend/model/horoscope/horoscope_selectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoroscopeCompatibilityCubit extends Cubit<HoroscopeSelectableItem?> {
  HoroscopeCompatibilityCubit() : super(null);

  HoroscopeSelectableItem? setState(HoroscopeSelectableItem? newState) {
    if (newState == null) return null;
    emit(newState);
    return newState;
  }
}
