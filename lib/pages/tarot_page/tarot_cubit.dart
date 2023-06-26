import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TarotCubit extends Cubit<TarotState> {
  TarotCubit(): super(TarotState(cards: []));
  
  
  bool toggle(bool event) {
    if(event) return pop();
    else return push();
  }


  bool push() {
    if(state.cards.length < 3){
      emit(TarotState(cards: state.cards..add("")));
      return true;
    }
    return false;
  }

  bool pop() {
    if(state.cards.length > 0 ) {
      emit(TarotState(cards: state.cards..removeLast()));
      return false;
    }
    return true;
  }
}

class TarotState extends Equatable{
    final List<String> cards;
    const TarotState({required this.cards});

    @override
    List<String> get props {
      return [...cards];
    }
  }