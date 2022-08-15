import 'package:equatable/equatable.dart';

class CustomTimerState extends Equatable {
  final int duration;
  final int question;

  const CustomTimerState({
    required this.duration,
    required this.question,
  });

  @override
  List<Object?> get props => [
        duration,
        question,
      ];
}

class CustomTimerInitialValue extends CustomTimerState {
  const CustomTimerInitialValue(
    duration,
    question,
  ) : super(
          duration: duration,
          question: question,
        );
}

class CustomTimerInProgress extends CustomTimerState {
  const CustomTimerInProgress(int duration, int question)
      : super(
          duration: duration,
          question: question,
        );
}

class CustomTimerComplete extends CustomTimerState {
  const CustomTimerComplete({required int question})
      : super(
          duration: 20,
          question: question == 1 ? 0 : 1,
        );
}
