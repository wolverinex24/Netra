import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netra/core/theme/appTheme.dart';
import 'package:netra/features/homeScreen/screens/widgets/cardwidget.dart';

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
        title: Text('Prediction Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: height * 0.009),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Soft shadow color
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Circular corners
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
                    'Prediction Result Text', // You can replace this with actual prediction result
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: height * 0.020),
                 Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5), // Soft shadow color
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10), // Circular corners
                                child: Image.asset(
                                  'assets/images/image1.png',
                                  width: 75,
                                  height: 75,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Label 1'),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5), // Soft shadow color
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10), // Circular corners
                                child: Image.asset(
                                  'assets/images/image2.png',
                                  width: 75,
                                  height: 75,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Label 2'),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5), // Soft shadow color
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10), // Circular corners
                                child: Image.asset(
                                  'assets/images/image3.png',
                                  width: 75,
                                  height: 75,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Label 3'),
                          ],
                        ),
                      ],
                    ),
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
                        padding: EdgeInsets.symmetric(horizontal:width*0.02, vertical:height*0.02, ),
                        child: Text('Continue Inspection',
                         style: TextStyle(
                                  color: AppTheme.whiteColor,
                                  fontSize: scale*1.3,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],

        ),
      ),
    );
  }
}
