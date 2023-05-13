import 'dart:convert' show json;

import 'package:flutter/services.dart' show rootBundle;
import 'package:quests/feature/data/models/quest_model.dart';
import 'package:quests/feature/domain/entities/quest.dart';
import 'package:quests/feature/domain/repositories/quest_repository.dart';

class QuestRepositoryImpl extends QuestRepository {
  late final dynamic jsonData;

  QuestRepositoryImpl();

  @override
  Future<int> getAnswer(int id) async {
    try {
      final Quest quest = await _getQuestByID(id);

      return quest.id;
    } catch (e) {
      throw Exception('QuestRepositoryImpl Failure: $e');
    }
  }

  @override
  Future<Quest> getQuest(int id) async {
    try {
      final Quest quest = await _getQuestByID(id);

      return quest;
    } catch (e) {
      throw Exception('QuestRepositoryImpl Failure: $e');
    }
  }

  Future<Quest> _getQuestByID(int id) async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response)['questions'][id];

    return QuestModel.fromJSON(id, data);
  }
}
