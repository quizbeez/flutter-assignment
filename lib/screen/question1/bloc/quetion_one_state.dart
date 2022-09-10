class QuestionOneState {

  String? ans;
  int? selectedIndex;
  List suggest = [
    "Machine learning causes global warming",
    "Unsecure networks lead to terrorist attacks",
    "NFTs contribute to poaching of animals",
    "Blockchains can use a lot of energy"
  ];
  List<bool>? suggestChoice=[];

  QuestionOneState({this.ans = "",this.suggestChoice,this.selectedIndex}){
    suggestChoice ??= [    false,
      false,
      false,
      false];
  }

  QuestionOneState copywith({String? text,List<bool>? list,int? index}) {

    return QuestionOneState(ans: text,suggestChoice: list,selectedIndex: index);
  }
}
