import 'package:flutter_bloc/flutter_bloc.dart';

class SelectableItemCubit extends Cubit<bool> {
  SelectableItemCubit(super.initialState);

  void setState(bool newState) {
    emit(newState);
  }
}