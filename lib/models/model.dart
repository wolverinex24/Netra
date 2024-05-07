import 'dart:io';
import 'package:flutter_tflite/flutter_tflite.dart';

Future<String>? modelLoadCustom(File? file) async {
  try {
    String? res = await Tflite.loadModel(
        model: "assets/model/Netra2.0v.tflite",
        labels: "assets/model/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset: true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate: false // defaults to false, set to true to use GPU delegate
    );
    var recognitions = await Tflite.runModelOnImage(
        path: file!.path,   // required
        imageMean: 0.0,   // defaults to 117.0
        imageStd: 255.0,  // defaults to 1.0
        numResults: 10,    // defaults to 5
        threshold: 0.2,   // defaults to 0.1
        asynch: true      // defaults to true
    );
    print(recognitions?[0]['label']);
    String result=recognitions?[0]['label'];
    print("result"+result);
    
    return result;
  } catch (e) {
    print('Error: $e');
    return "null";
  }
}



