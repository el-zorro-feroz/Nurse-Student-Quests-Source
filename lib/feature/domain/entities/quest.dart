import 'package:equatable/equatable.dart';

class Quest extends Equatable {
  final int id;
  final String question;
  final List<String> answers;
  final int answer;

  const Quest({
    required this.id,
    required this.question,
    required this.answers,
    required this.answer,
  });

  @override
  List<Object?> get props => [id];
}
