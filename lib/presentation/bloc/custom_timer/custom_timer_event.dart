import 'package:equatable/equatable.dart';

class CustomTimerEvent extends Equatable {
  const CustomTimerEvent();

  @override
  List<Object?> get props => [];
}

class TimerStarted extends CustomTimerEvent {
  final int duration;
  final int question;

  const TimerStarted(
    this.duration,
    this.question,
  );
}

class TimerReset extends CustomTimerEvent {}

class TimerTicked extends CustomTimerEvent {
  final int duration;
  final int question;

  const TimerTicked(
    this.duration,
    this.question,
  );

  @override
  List<Object> get props => [
        duration,
        question,
      ];
}
