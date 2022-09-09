import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TimerState extends Equatable {}

class InitialTimer extends TimerState {
  @override
  List<Object?> get props => [];
}

class CountDown extends TimerState {
  final int secondRemain;

  CountDown({required this.secondRemain});

  @override
  List<Object> get props => [secondRemain];
}

class TimerFinish extends TimerState {
  @override
  List<Object?> get props => [];
}

class TimerStop extends TimerState {
  @override
  List<Object?> get props => [];
}