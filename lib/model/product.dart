import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? correct;
  final String? question;
  List<String> options = [];
  bool? isCorrect;

  Product(
      {this.correct,
      required this.options,
      this.question,
      this.isCorrect = false});

  @override
  List<Object?> get props => [correct, options, question, isCorrect];

  static List<Product> products = [
    Product(
        question: "What is one potential environmental concern about Web 3.0?",
        correct: "Blockchains can use a lot of energy",
        options: const [
          "Machine learning causes global warming",
          "Unsecure networks lead to terrorist attacks",
          "NFTs contribute to poaching of animals",
          "Blockchains can use a lot of energy",
        ]),
    Product(
        question:
            "Which of the following is an example of a trustless transaction that takes place on Web 3.0?",
        correct: "Sending Bitcoin to someone else",
        options: const [
          "Paying someone through PayPal",
          "Buying something on Amazon.com",
          "Taking a screenshot of an NFT",
          "Sending Bitcoin to someone else",
        ]),
  ];
}
