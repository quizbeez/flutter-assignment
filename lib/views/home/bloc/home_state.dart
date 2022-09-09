part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class UpdateTextState extends HomeState {
  final Product product;

  const UpdateTextState({required this.product});
}

class IncreaseScore extends HomeState {
  const IncreaseScore();

  @override
  List<Object> get props => [];
}

class ShowSnackbarState extends HomeState {}
