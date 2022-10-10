import 'package:diabe_trek/providers/dfu_provider.dart';
import 'package:diabe_trek/screens/HomePage.dart';
import 'package:diabe_trek/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DFUProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diab-Trek Demo',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: const HomePage(),
    );
  }
}
