// ignore_for_file: non_constant_identifier_names

import 'package:quests/core/use_case/use_case.dart';
import 'package:quests/feature/data/repository/quest_repository_impl.dart';
import 'package:quests/feature/domain/entities/quest.dart';
import 'package:quests/feature/domain/repositories/quest_repository.dart';

class GetQuestUseCase extends UseCase<Quest, int> {
  final QuestRepository _repository = QuestRepositoryImpl();

  GetAnswerUseCase() {}

  @override
  Future<Quest> call(int param) async {
    try {
      return await _repository.getQuest(param);
    } catch (e) {
      throw Exception('GetAnswerUseCase Failure: $e');
    }
  }
}
