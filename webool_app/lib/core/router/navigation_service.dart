part of 'router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final globalScaffoldKey = GlobalKey<ScaffoldState>();
final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: '/',
      navigatorKey: rootNavigatorKey,
      routes: routes,
    );
  },
);
