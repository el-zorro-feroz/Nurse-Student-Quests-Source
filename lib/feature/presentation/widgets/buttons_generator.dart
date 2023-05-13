import 'package:flutter/cupertino.dart';

class ButtonsGenerator extends StatelessWidget {
  final List<String> answers;
  final int correct;
  final Function(int) onResult;
  final int? selected;

  const ButtonsGenerator({
    super.key,
    required this.answers,
    required this.correct,
    required this.onResult,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: 4,
      itemBuilder: (_, index) {
        final int correctIndex = 3 - index;
        final int correntAnswerIndex = correct - 1;

        final answer = answers[correctIndex];
        final resultStage = selected != null;

        Color? getDecorationColor() {
          if (resultStage) {
            if (correntAnswerIndex == selected && correctIndex == selected) {
              return CupertinoColors.activeGreen;
            }

            if (correctIndex == correntAnswerIndex) {
              return CupertinoColors.activeGreen;
            }

            if (correctIndex == selected) {
              return CupertinoColors.systemRed;
            }

            // return CupertinoColors.systemRed;
          }

          return null;
        }

        final Color? decorationColor = getDecorationColor();

        return GestureDetector(
          onTap: () => onResult(correctIndex),
          child: Container(
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 6.0,
            ),
            decoration: BoxDecoration(
              color: decorationColor,
              border: Border.all(
                color: decorationColor ?? CupertinoColors.activeBlue,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              answer,
              style: const TextStyle(
                color: CupertinoColors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.05,
              ),
            ),
          ),
        );
      },
    );
  }
}
