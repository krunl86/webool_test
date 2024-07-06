import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webool_test/core/router/routes.dart';

part 'navigation_service.dart';

class AppRouter extends ConsumerWidget {
  const AppRouter({
    super.key,
    required this.builder,
  });

  final Widget Function(
    BuildContext,
    RouterConfig<Object> router,
  ) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return builder(context, router);
  }
}
