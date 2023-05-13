import 'package:quests/feature/domain/entities/quest.dart';

class QuestModel extends Quest {
  const QuestModel({
    required super.id,
    required super.question,
    required super.answers,
    required super.answer,
  });

  static fromJSON(int id, Map<String, dynamic> data) {
    try {
      final question = data['question'] as String;
      final answers = data['answers'] as List;
      final answer = data['answer'] as int;

      return QuestModel(
        id: id,
        question: question,
        answers: answers.map((e) => e as String).toList(),
        answer: answer,
      );
    } catch (e) {
      throw Exception('Invalid JSON Data: $e');
    }
  }
}
