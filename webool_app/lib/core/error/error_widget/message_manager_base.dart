import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_test/core/error/error_widget/toaster_widgets.dart';

// MessageManager is Main WIdget Used to manage and show loaders and logs and errors on Screen
class MessageManager extends ConsumerWidget {
  const MessageManager({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // getting current Message from message service by watching message service state
    final currentMessage =
        ref.watch(toastMessageServiceProvider).currentMessage;
    final Widget messageWidget;
    // if message WIdget is not null then show component added in Message
    //wether a loader or success or failed error popup on screen
    if (currentMessage != null) {
      messageWidget = currentMessage.builder(context);
    } else {
      // if currentMessage is null then sinking UI to remove it from screen
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

// Loader Indicator widget
// this will be used by Message Service class to add loader on Screen
class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
