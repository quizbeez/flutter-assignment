class QuestionTwoState {
  String? ans;
  int? selectedIndex;
  List suggest = [
    "Paying someone through PayPal",
    "Buying something on Amazon.com",
    "Taking a screenshot of an NFT",
    "Sending Bitcoin to someone else"
  ];
  List<bool>? suggestedChoice = [];

  QuestionTwoState({this.ans, this.suggestedChoice, this.selectedIndex}) {
    suggestedChoice ??= [
      false,
      false,
      false,
      false,
    ];
  }
  QuestionTwoState copywith({String? text,List<bool>? list,int? index}){
    return QuestionTwoState(ans: text,selectedIndex: index,suggestedChoice: list);
  }
}
