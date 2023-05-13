import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quests/feature/domain/entities/quest.dart';
import 'package:quests/feature/presentation/bloc/quest_bloc.dart';
import 'package:quests/feature/presentation/pages/not_found_page.dart';
import 'package:quests/feature/presentation/widgets/buttons_generator.dart';

class QuestPage extends StatelessWidget {
  const QuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: OrientationBuilder(
        builder: (context, orientation) {
          const page = QuestPageContent();

          switch (orientation) {
            case Orientation.portrait:
              return page;
            case Orientation.landscape:
              return Row(
                children: const [
                  Expanded(child: SizedBox.shrink()),
                  Expanded(child: page),
                  Expanded(child: SizedBox.shrink()),
                ],
              );
          }
        },
      ),
    );
  }
}

class QuestPageContent extends StatelessWidget {
  const QuestPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<QuestBloc, QuestState>(
        bloc: BlocProvider.of<QuestBloc>(context),
        builder: (context, state) {
          if (state.runtimeType == QuestInitState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (state.runtimeType == QuestDataState) {
            final cState = (state as QuestDataState);

            return QuestProgressPage(
              quest: cState.quest,
              selected: cState.selectedQuest,
            );
          }

          return const NotFoundPage();
        },
      ),
    );
  }
}

class QuestProgressPage extends StatelessWidget {
  final Quest quest;
  final int? selected;

  const QuestProgressPage({
    super.key,
    required this.quest,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              '${quest.id + 1}. ${quest.question}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: CupertinoColors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                letterSpacing: .05,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: ButtonsGenerator(
            answers: quest.answers,
            correct: quest.answer,
            selected: selected,
            onResult: (result) {
              final bloc = BlocProvider.of<QuestBloc>(context);
              bloc.add(ReleaseQuestEvent(question: result));
            },
          ),
        ),
      ],
    );
  }
}
