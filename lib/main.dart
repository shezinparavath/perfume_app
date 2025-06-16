import 'package:flutter/material.dart';
import 'package:perfume_app/controllers/home_data_controller.dart';
import 'package:perfume_app/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeDataController()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Hellix'),
        home: const SplashScreen(),
      ),
    );
  }
}
