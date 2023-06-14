import 'package:fallora/backend/util/selectable_item.dart';

class SelectableItemController<T extends SelectableItem> {
    int previousSelected = 0;
    List<T> items;

    SelectableItemController(this.items);

    void onItemChanged(int index){
      items[previousSelected].setState(false);
      items[index].setState(true);
      previousSelected = index;
    }

  T get currentItem => items[previousSelected];
}

class DualSelectableItemController<T1 extends SelectableItem,T2 extends SelectableItem> {
    int previousSelected1 = 0;
    int previousSelected2 = 0;

    List<T1> items1;
    List<T2> items2;

    DualSelectableItemController(this.items1,this.items2);

    void onItemChanged1(int index){
      items1[previousSelected1].setState(false);
      items1[index].setState(true);
      previousSelected1 = index;
    }

    void onItemChanged2(int index){
      items2[previousSelected2].setState(false);
      items2[index].setState(true);
      previousSelected2 = index;
    }

    T1 get currentItem1 => items1[previousSelected1];
    T2 get currentItem2 => items2[previousSelected2];
}