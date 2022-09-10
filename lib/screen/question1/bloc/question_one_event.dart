abstract class QuestionOneEvent{}
class OnInit extends QuestionOneEvent{

}
class NextPage extends QuestionOneEvent{

}
class OnStoreAns extends QuestionOneEvent{
  final String? text;
  final int? index;
  OnStoreAns({this.text,this.index});

}
