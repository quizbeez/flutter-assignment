part of 'trivia_bloc.dart';

@freezed
 class TriviaEvent with _$TriviaEvent {
   factory TriviaEvent.next() = _TriviaEventNext;
   factory TriviaEvent.answer(String answer) = _TriviaEventAnswer;
   factory TriviaEvent.timeout() = _TriviaEventTimeout;
 }
