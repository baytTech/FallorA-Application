
import 'package:fallora/backend/model/gender/gender.dart';
import 'package:fallora/backend/util/selectable_item.cubit.dart';
import 'package:fallora/backend/util/selectable_item.dart';
import 'package:fallora/flutter_flow/flutter_flow_util.dart';

class GenderSelectableItem extends SelectableItem {
  final Gender gender;
  final SelectableItemCubit isSelected;
  const GenderSelectableItem._({
    required this.gender,
    required this.isSelected
  }): super(isSelected: isSelected);

  factory GenderSelectableItem({
    required Gender gender,
    required bool isSelected
  }) {
    return GenderSelectableItem._(gender: gender, isSelected: SelectableItemCubit(isSelected));
  }


  static List<GenderSelectableItem> generate() {
    return Gender.values.mapIndexed((p0, p1) => GenderSelectableItem(gender: p1,isSelected: p0 == 0));
  }
}