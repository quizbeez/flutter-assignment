part of 'trivia_bloc.dart';

@freezed
class TriviaState with _$TriviaState {
  const factory TriviaState({
    required bool noUse,
    required int index,
    required List questions,
    required AnswerState answerState,
  }) = _TriviaState;

  factory TriviaState.initial() => const TriviaState(
        noUse: false,
        index: 0,
        answerState: AnswerState.initial(),
        questions: [
          {
            "incorrect": [
              "Machine learning causes global warming",
              "Unsecure networks lead to terrorist attacks",
              "NFTs contribute to poaching of animals"
            ],
            "text":
                "What is one potential environmental concern about Web 3.0?",
            "correct": "Blockchains can use a lot of energy"
          },
          {
            "incorrect": [
              "Paying someone through PayPal",
              "Buying something on Amazon.com",
              "Taking a screenshot of an NFT"
            ],
            "text":
                "Which of the following is an example of a trustless transaction that takes place on Web 3.0?",
            "correct": "Sending Bitcoin to someone else"
          }
        ],
      );

}


@freezed
class AnswerState with _$AnswerState{
   const factory AnswerState.initial() = _AnswerStateInitial;
  const factory AnswerState.correct() = _AnswerStateCorrect;
  const factory AnswerState.inCorrect() = _AnswerStateInCorrect;
  const factory AnswerState.unAnswered() = _AnswerStateUnAnswered;
}