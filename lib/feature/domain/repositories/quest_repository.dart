import 'package:quests/feature/domain/entities/quest.dart';

abstract class QuestRepository {
  Future<Quest> getQuest(int id);
  Future<int> getAnswer(int id);
}
