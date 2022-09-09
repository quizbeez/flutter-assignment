part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StartHome extends HomeEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

///   Button tap event
class ButtonTappedEvent extends HomeEvent {}

///   Increase score event
class IncreaseScoreEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ChangeHome extends HomeEvent {
  final Product? product;

  const ChangeHome({this.product});

  @override
  // TODO: implement props
  List<Object> get props => [product!];
}
