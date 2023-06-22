import 'package:fallora/backend/model/horoscope/horoscope_selectable.dart';
import 'package:fallora/backend/model/gender/gender_selectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoroscopeCompatibilityState {
  final GenderSelectableItem? gender;
  final HoroscopeSelectableItem? horoscope;

  HoroscopeCompatibilityState({this.gender, this.horoscope});
}

class HoroscopeCompatibilityCubit extends Cubit<HoroscopeCompatibilityState> {
  HoroscopeCompatibilityCubit()
      : super(HoroscopeCompatibilityState(gender: null, horoscope: null));

  void setGender(GenderSelectableItem gender) {
    emit(state.copyWith(gender: gender));
  }

  void setHoroscope(HoroscopeSelectableItem horoscope) {
    emit(state.copyWith(horoscope: horoscope));
  }
}

extension HoroscopeCompatibilityStateExtension on HoroscopeCompatibilityState {
  HoroscopeCompatibilityState copyWith({
    GenderSelectableItem? gender,
    HoroscopeSelectableItem? horoscope,
  }) {
    return HoroscopeCompatibilityState(
      gender: gender ?? this.gender,
      horoscope: horoscope ?? this.horoscope,
    );
  }
}
