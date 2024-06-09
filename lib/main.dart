import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/splash_screen.dart';
import 'package:global_edu/views/dashboard.dart';
import 'package:global_edu/views/home_pages/universities.dart';
import 'package:global_edu/views/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyBUp-MeIrJR42lGMHrxd8nIf60-2-k201Q',
              appId: '1:405595924893:android:b47e01a00c65dcaa88a774',
              messagingSenderId: '405595924893',
              projectId: 'global-edu'))
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
