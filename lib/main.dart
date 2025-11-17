import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:season_sir_mobileapp/firebase_options.dart';
import 'package:season_sir_mobileapp/routes.dart';
import 'package:season_sir_mobileapp/views/maps/mapspage.dart';
import 'package:season_sir_mobileapp/views/news/detailpagegrid.dart';
import 'views/news/dashboard.dart';
import 'views/chatapp/Chats.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ensures Flutter is ready before Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PCPS DEMO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute:AppRoute.gridapppage,
      routes:AppRoute.getAppRoutes(),
    );
  }
}