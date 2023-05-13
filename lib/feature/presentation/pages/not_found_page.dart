import 'package:flutter/cupertino.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: const Text(
        'An unexpected error was thrown',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: CupertinoColors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.05,
        ),
      ),
    );
  }
}
