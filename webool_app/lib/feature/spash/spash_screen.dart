import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpashScreen extends StatelessWidget {
  const SpashScreen({super.key});
  static SpashScreen builder(BuildContext context, GoRouterState state) =>
      const SpashScreen();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Center(
          child: Text(
        'Spash Screen',
        style: theme.textTheme.bodyMedium,
      )),
    );
  }
}
