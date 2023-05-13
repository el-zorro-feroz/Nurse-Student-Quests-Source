import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quests/feature/presentation/bloc/quest_bloc.dart';
import 'package:quests/feature/presentation/pages/not_found_page.dart';
import 'package:quests/feature/presentation/pages/quest_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Quests',
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route? _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) {
          final bloc = QuestBloc();

          return BlocProvider<QuestBloc>(
            create: (_) => bloc,
            child: const QuestPage(),
          );
        });
      default:
        return CupertinoPageRoute(
          builder: (_) => const CupertinoPageScaffold(
            child: NotFoundPage(),
          ),
        );
    }
  }
}
