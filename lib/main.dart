import 'package:flutter/material.dart';
import 'package:lyw_lessors/auth/widgets/auth_wall.dart';
import 'package:lyw_lessors/configuration/constants/environment.dart';

void main() async {
  await Environment.initEnvironment();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lead Your Way Lessors',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthWall(),
    );
  }
}
