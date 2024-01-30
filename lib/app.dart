import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/Skills/skill_screen.dart';
import 'screens/Play/play_screen.dart';
import 'screens/Rosters/teams_screen.dart';
import 'screens/Rosters/roster_screen.dart';
/*
  // Official colors and info that I cannot use at this time
    // Tan color: #f8e9d5 rgba(233,220,202,255)
    // Blue color: #0c4483 rgba(13,69,132,255)
    // Red color: #a80506 rgba(168,5,6,255)
    // Text theme: Nuffle (I would need to download this from elsewhere and put it in the pubspec.yaml to make it actually work)
*/

class MyApp extends StatefulWidget {
  
  const MyApp({super.key});

  static final routes = {
    '/': (context) => const CircularProgressIndicator(),
    'HomeScreen': (context) => const HomeScreen(),
    'PlayScreen' : (context) => const PlayScreen(),
    'SkillScreen': (context) => const SkillScreen(),
    'TeamsScreen' : (context) => const TeamsScreen(),
    'RosterScreen' : (context) => const RosterScreen(),
    // Maybe a dice roller for those who want one?
      // Or put it on the play screen as an option
  };

  @override
  AppState createState() => AppState();
}

class AppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BloodBowl App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.red.shade500),
        scaffoldBackgroundColor: Colors.amber.shade50,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 22.0, 
          ), // What the appbar uses by default
        )
      ),
      routes: MyApp.routes,
      initialRoute: 'HomeScreen'
    );
  }
}