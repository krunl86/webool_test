import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webool_common/webool_common.dart';
import 'package:webool_test/core/router/router.dart';

import '../error/error_widget/message_manager_base.dart';

class WeboolTest extends ConsumerStatefulWidget {
  const WeboolTest({super.key});

  @override
  ConsumerState<WeboolTest> createState() => _WeboolTestState();
}

class _WeboolTestState extends ConsumerState<WeboolTest> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 1), () {
      ref.read(routerProvider).goNamed('dashboard');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return AppRouter(
            builder: (context, router) => MaterialApp.router(
                  title: 'HomeLister',
                  debugShowCheckedModeBanner: false,
                  routerConfig: router,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  builder: (BuildContext context, Widget? child) {
                    return Material(
                      child: MessageManager(
                        child: child!,
                      ),
                    );
                  },
                ));
      },
    );
  }
}
