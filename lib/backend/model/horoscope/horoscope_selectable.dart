import 'package:fallora/backend/model/horoscope/horoscope.dart';
import 'package:fallora/backend/util/selectable_item.cubit.dart';
import 'package:fallora/backend/util/selectable_item.dart';
import 'package:fallora/flutter_flow/flutter_flow_util.dart';

class HoroscopeSelectableItem extends SelectableItem{
  final Horoscope horoscope;
  final SelectableItemCubit isSelected;
  const HoroscopeSelectableItem._({
    required this.horoscope,
    required this.isSelected
  }): super(isSelected: isSelected);

  factory HoroscopeSelectableItem({
    required Horoscope horoscope,
    required bool isSelected
  }) {
    return HoroscopeSelectableItem._(horoscope: horoscope, isSelected: SelectableItemCubit(isSelected));
  }

  static List<HoroscopeSelectableItem> generate() {
    return Horoscope.values.mapIndexed((i,e) => HoroscopeSelectableItem(horoscope: e, isSelected: (i == 0)));
  }
}