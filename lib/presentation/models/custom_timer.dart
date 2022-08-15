class CustomTimer {
  const CustomTimer();

  Stream<int> getTime({
    required int value,
    required int question,
  }) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (time) {
        return value - time - 1;
      },
    ).take(value);
  }

  int getQuestion({required int question}){
    return question;
  }
}
