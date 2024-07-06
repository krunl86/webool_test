import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_test/core/error/error_widget/toaster_widgets.dart';

import '../error_services/message_service_base.dart';

class MessageManager extends ConsumerWidget {
  const MessageManager({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMessage =
        ref.watch(toastMessageServiceProvider).currentMessage;
    final Widget messageWidget;
    if (currentMessage != null) {
      messageWidget = currentMessage.builder(context);
    } else {
      messageWidget = const SizedBox.shrink();
    }

    return Stack(
      children: [
        child,
        messageWidget,
      ],
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
