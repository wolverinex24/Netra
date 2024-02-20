import 'package:flutter/material.dart';
import 'package:netra/core/theme/appTheme.dart';
import 'package:netra/features/languageselect/screens/lanselect.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a long loading process to display the splash screen for a certain duration
    _navigateToMainScreen();
  }

  void _navigateToMainScreen() async {
    await Future.delayed(Duration(seconds: 2)); // Change the duration as needed
    // Navigate to the main screen after the splash screen duration
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LanSelect()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double scale = MediaQuery.of(context).textScaleFactor * 12; // Use textScaleFactor for font scaling

    return Scaffold(
      // Customize your splash screen UI here
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: width/2),
            child: Container(
              width: width / 2,
              height: height / 4,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(width / 2),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Image.asset(
                "assets/images/NETRA.png",
                height: height/2,
                fit: BoxFit.fill,
                // Adjust as needed
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.20, left: width / 2.8),
                child: Text(
                  "NETRA",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: scale * 3,
                  ),
                ),
              ),
            ],
          ),
          Padding(
           padding: EdgeInsets.only(left: width/2),
            child: Container(
              width: width / 2,
              height: height / 4,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width / 2),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
