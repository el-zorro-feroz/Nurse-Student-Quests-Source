part of 'quest_bloc.dart';

abstract class QuestEvent extends Equatable {
  const QuestEvent();

  @override
  List<Object> get props => [];
}

class ReleaseQuestEvent extends QuestEvent {
  final int question;

  const ReleaseQuestEvent({
    required this.question,
  });

  @override
  List<Object> get props => [question];
}
