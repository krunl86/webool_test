import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app/app.dart';

void main() async {
  final providerContainer = ProviderContainer();
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(UncontrolledProviderScope(
    container: providerContainer,
    child: const WeboolTest(),
  ));
}
