import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netra/core/theme/appTheme.dart';
import 'package:netra/features/result_screen/widgets/cardwidget.dart';
import 'package:netra/features/result_screen/widgets/peticides_details.dart';
import 'package:netra/models/model.dart';

// class ResultScreen extends StatelessWidget {
//   final File image;

//   ResultScreen({required this.image});

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     double scale = MediaQuery.of(context).textScaleFactor * 12;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Prediction Result',
//         style: GoogleFonts.montserrat(
//                 fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: height * 0.009),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5), // Soft shadow color
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20), // Circular corners
//                 child: Image.file(
//                   image,
//                   width: width * 0.8,
//                   height: height * 0.4,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             SizedBox(height: height * 0.020),
//             const Text(
//               'Prediction Result Text', // You can replace this with actual prediction result
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: height * 0.020),
//             const PesticideDetailsCard(),
//             SizedBox(height: height * 0.010),
//             Expanded(
//               child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 itemCount:
//                     3, // Replace 'itemCount' with the actual number of items
//                 itemBuilder: (context, index) {
//                   return CustomCard(
//                     label:
//                         'Label Text', // Replace 'Label Text' with your label text
//                     imagePath:
//                         'assets/images/image1.png', // Replace 'assets/circle_image.png' with your image path
//                     onPressed: () {
//                       // Add your onPressed logic here
//                     },
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: height * 0.020),
//             Padding(
//               padding: EdgeInsets.only(bottom: height * 0.020),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppTheme.primaryColor,
//                   shadowColor: Colors.grey[600],
//                   elevation: 5,
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: width * 0.02,
//                     vertical: height * 0.02,
//                   ),
//                   child: Text(
//                     'Continue Inspection',
//                     style: TextStyle(
//                       color: AppTheme.whiteColor,
//                       fontSize: scale * 1.3,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class ResultScreen extends StatelessWidget {
  final File image;
  
  ResultScreen({required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double scale = MediaQuery.of(context).textScaleFactor * 12;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Prediction Result',
          style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<String>(
        future: modelLoadCustom(image), // Replace predictResult with your function for prediction
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the prediction result, show a loading indicator
            return Center(child: SpinKitSpinningLines(

              size: scale*20,
              color: AppTheme.primaryColor,
            
            ));
          } else if (snapshot.hasError) {
            // If an error occurs during prediction, display an error message
            return Center(child: Text('Error occurred: ${snapshot.error}'));
          } else {
            // If the prediction is successful, display the result
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * 0.009),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        image,
                        width: width * 0.8,
                        height: height * 0.4,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.020),
                  Text(
                    snapshot.data ?? 'Prediction Result not found!!',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: height * 0.020),
                  PesticideDetailsCard(),
                  SizedBox(height: height * 0.010),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 3, // Replace 'itemCount' with the actual number of items
                      itemBuilder: (context, index) {
                        return CustomCard(
                          label: 'Label Text', // Replace 'Label Text' with your label text
                          imagePath: 'assets/images/image1.png', // Replace 'assets/circle_image.png' with your image path
                          onPressed: () {
                            // Add your onPressed logic here
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.020),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.020),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        shadowColor: Colors.grey[600],
                        elevation: 5,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
                        child: Text(
                          'Continue Inspection',
                          style: TextStyle(color: AppTheme.whiteColor, fontSize: scale * 1.3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<String> predictResult() async {
    // Simulate a delay for prediction
    await Future.delayed(Duration(seconds: 5));
    // Replace this with your actual prediction logic
    return 'Prediction Result Text';
  }
}
