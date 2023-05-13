// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quests/feature/domain/entities/quest.dart';
import 'package:quests/feature/domain/use_cases/get_quest_use_case.dart';

part 'quest_event.dart';
part 'quest_state.dart';

const questsCount = 59;

class QuestBloc extends Bloc<QuestEvent, QuestState> {
  late final _getQuestUseCase = GetQuestUseCase();

  QuestBloc() : super(QuestInitState()) {
    on<ReleaseQuestEvent>(_onReleaseQuestEvent);

    _onInitQuestStateBloc();
  }

  int currentID = 58;

  //! Utils
  Future<Quest> _getNextQuest() async {
    currentID = currentID + 1;
    if (currentID >= questsCount) {
      currentID = 0;
    }

    return await _getQuestUseCase(currentID);
  }

  //! Handlers
  FutureOr<void> _onInitQuestStateBloc() async {
    final nextQuest = await _getNextQuest();

    emit(QuestDataState(
      id: currentID,
      quest: nextQuest,
    ));
  }

  FutureOr<void> _onReleaseQuestEvent(
    ReleaseQuestEvent event,
    Emitter<QuestState> emit,
  ) async {
    if (state is QuestDataState) {
      if ((state as QuestDataState).selectedQuest == null) {
        final newState = QuestDataState(
          id: currentID,
          quest: (state as QuestDataState).quest,
          selectedQuest: event.question,
        );

        emit(newState);
      } else {
        print('2');
        final quest = await _getNextQuest();
        emit(QuestDataState(
          id: currentID,
          quest: quest,
        ));
      }
    }
  }
}
