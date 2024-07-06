import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_common/webool_common.dart';
import 'package:webool_test/core/error/error_services/message_service_base.dart';

import '../message_model/message.dart';

const _kLogDuration = Duration(seconds: 1, milliseconds: 500);
const _kErrorDuration = Duration(seconds: 3);
final toastMessageServiceProvider =
    StateNotifierProvider<ToastMessageService, MessageServiceState>(
  (ref) => ToastMessageService(),
);

class ToastMessageService extends MessageServiceBase {
  void addFlash(Widget fullScreenMessage) => add(
        Message(
          duration: const Duration(seconds: 3),
          builder: (context) => Positioned.fill(
            child: fullScreenMessage,
          ),
        ),
      );

  void addLoader() => add(
        Message(
            builder: (context) =>
                const Center(child: CircularProgressIndicator())),
      );

  void addLog({required String message}) => add(
        Message(
          duration: _kLogDuration,
          builder: (context) => Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.black,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void addSuccess(String msg) => add(
        Message(
          duration: _kErrorDuration,
          builder: (context) => Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SuccessToast(
                text: msg,
                onClose: () {},
              ),
            ),
          ),
        ),
      );

  void addError(String error, {bool isAppbarVisible = false}) => add(
        Message(
          duration: _kErrorDuration,
          builder: (context) => Positioned(
            top: isAppbarVisible ? kToolbarHeight : 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: ErrorToast(
                error: error,
              ),
            ),
          ),
        ),
      );
}

class SuccessToast extends StatelessWidget {
  const SuccessToast({
    super.key,
    required this.text,
    this.onClose,
  });

  final String text;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BaseToast(
        text: text, onClose: onClose, backgroundColor: Colors.green);
  }
}

class ErrorToast extends StatelessWidget {
  const ErrorToast({
    super.key,
    this.error,
    this.onClose,
  });

  final dynamic error;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String errorTxt;
    if (error is String) {
      errorTxt = error;
    } else {
      errorTxt = 'Something Went Wrong';
    }
    return BaseToast(
      text: errorTxt,
      onClose: onClose,
      backgroundColor: theme.weboolColors.primaryRed!,
    );
  }
}

class BaseToast extends StatelessWidget {
  const BaseToast({
    super.key,
    required this.text,
    this.onClose,
    required this.backgroundColor,
  });

  final String text;
  final VoidCallback? onClose;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsOf(context).symmetric(
                vertical: DimensionToken.smaller,
              ),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.weboolColors.fontWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
