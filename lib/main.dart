import 'core/shared/main_screen.dart';
import 'package:flutter/services.dart';

import 'features/Credits/presentation/pages/person_details_screen.dart';
import 'package:flutter/material.dart';

import 'core/shared/details_screen.dart';
import 'features/movie/presentation/pages/movie_screen.dart';
import 'features/tv/presentation/pages/tv_screen.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    const MyApp(),
  );
}

/// Entery point
class MyApp extends StatelessWidget {
  /// default constructor
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          headline5: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      home: const MainScreen(),
      routes: <String, WidgetBuilder>{
        MovieScreen.routeName: (BuildContext context) => const MovieScreen(),
        TvScreen.routeName: (BuildContext context) => const TvScreen(),
        DetailsScreen.routeName: (BuildContext context) =>
            const DetailsScreen(),
        PersonDetailsScreen.routeName: (BuildContext context) =>
            const PersonDetailsScreen()
      },
    );
  }
}
