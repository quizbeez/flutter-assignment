import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/model/product.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int score = 0;
  int totalScore = 100;

  HomeBloc() : super(HomeLoadingState()) {
    on<ButtonTappedEvent>(_buttonTapped);
    on<IncreaseScoreEvent>(_increaseScore);
  }

  ///  Button Tap Event
  Future<void> _buttonTapped(ButtonTappedEvent e, Emitter emit) async {
    emit(UpdateTextState(
      product: Product.products[1],
    ));
  }

  ///  Increase Score Event

  Future<void> _increaseScore(IncreaseScoreEvent e, Emitter emit) async {
    if (score < totalScore) {
      score = score + 100;
    }
    emit(const IncreaseScore());
  }
}
