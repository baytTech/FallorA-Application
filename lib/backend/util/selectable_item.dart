import 'package:fallora/backend/util/selectable_item.cubit.dart';

abstract class SelectableItem {
  final SelectableItemCubit isSelected;
  const SelectableItem({required this.isSelected});


  void setState(bool newState) {
    isSelected.setState(newState);
  }
}