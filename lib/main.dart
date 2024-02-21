import 'package:flutter/material.dart';
import 'package:netra/core/theme/appTheme.dart';
import 'package:netra/features/splashScreen/screens/spalshscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Prediction App',
      theme: ThemeData(

        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppTheme.primaryColor),),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: AppTheme.primaryColor).copyWith(background: AppTheme.whiteColor),
        // Add more theme properties here
      ),
      home: SplashScreen(),
    );
  }
}
