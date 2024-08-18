import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:global_edu/constants/my_colors.dart';
import 'package:global_edu/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyDlilmM3QBxFsJLF1erhMKj6WSr2FXUQ7E',
              appId: '1:232413993843:android:52a7c6f7620c65ad1e4306',
              messagingSenderId: '232413993843',
              projectId: 'global-edu-aabb3'))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Edu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.black),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
