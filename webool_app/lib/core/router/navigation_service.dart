part of 'router.dart';

// routing Naavigation key  : used to navigatate without context
final rootNavigatorKey = GlobalKey<NavigatorState>();
//  rouuter provider : used to provider go_router provider to manage route management
final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: '/',
      navigatorKey: rootNavigatorKey,
      routes: routes,
    );
  },
);
