abstract class QuestionTwoEvent {}

class OnStart extends QuestionTwoEvent {}

class OnStoreSecondAns extends QuestionTwoEvent {
  final String? text;
  final int? index;

  OnStoreSecondAns({this.text, this.index});
}
