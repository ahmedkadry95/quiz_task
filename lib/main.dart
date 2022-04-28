import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task/locator.dart';
import 'package:task/routs/app_router.dart';
import 'package:task/routs/routs_names.dart';
import 'package:task/services/navigation_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      initialRoute: RouteName.splash,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
