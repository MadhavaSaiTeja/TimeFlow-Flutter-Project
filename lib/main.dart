import 'package:demo/pages/auth_page.dart';
import 'package:demo/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'firebase_options.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();

  //open a box
  await Hive.openBox("Habit_Database");

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Setting',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: hexStringToColor("#0B666A")),
        useMaterial3: true,
      ),
      home: AuthPage(),
    );
  }
}
