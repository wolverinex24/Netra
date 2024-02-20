import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:netra/features/homeScreen/screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Prediction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PredictionScreen(),
    );
  }
}
