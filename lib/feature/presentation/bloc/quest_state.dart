part of 'quest_bloc.dart';

abstract class QuestState extends Equatable {
  const QuestState();

  @override
  List<Object> get props => [];
}

class QuestInitState extends QuestState {}

class QuestDataState extends QuestState {
  final int id;
  final Quest quest;
  final int? selectedQuest;

  const QuestDataState({
    required this.id,
    required this.quest,
    this.selectedQuest,
  });

  @override
  List<Object> get props => [id, selectedQuest ?? -1];
}
