import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:netra/core/constants/colors.dart';
import 'package:netra/core/theme/appTheme.dart';
import 'package:netra/features/homeScreen/widgets/drawer_home.dart';
import 'package:netra/features/homeScreen/widgets/timelinetile_widget.dart';
import 'package:netra/features/languageselect/widgets/localization_services.dart';
import 'package:netra/features/result_screen/screens/resultScreen.dart';
import 'package:netra/models/model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      navigateToResultScreen();
    } else {
      print('No image selected.');
    }
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      
      
      navigateToResultScreen();
    } else {
      print('No image selected.');
    }
  }

  void navigateToResultScreen() {
    if (_image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(image: _image!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
                style: ElevatedButton.styleFrom(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "netra".tr,
            style: GoogleFonts.montserrat(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: height * 0.60,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: lightGreenBackground,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 7,
                        spreadRadius: 5,
                        offset: Offset(2, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    CustomTimelineTile(),
                    SizedBox(
                      height: height*0.002,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  title: Text("Select Image Source"),
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Close the dialog
                                        getImageFromCamera(); // Open camera
                                      },
                                      child: Text('Camera'),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Close the dialog
                                        getImageFromGallery(); // Open gallery
                                      },
                                      child: Text('Gallery'),
                                    ),
                                  ],
                                );
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                            backgroundColor: AppTheme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Text(
                            "start".tr,
                            style: GoogleFonts.montserrat(
                                color: AppTheme.whiteColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "recentResults".tr,
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
