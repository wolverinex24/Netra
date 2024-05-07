import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netra/core/theme/appTheme.dart';
import 'package:netra/features/homeScreen/screens/homeScreen.dart';
import 'package:netra/features/languageselect/screens/lan_select.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Check if the app has been launched before
    _checkFirstLaunch();
  }

  void _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('firstLaunch') ?? true;

    // If it's the first launch, navigate to the language selection screen
    if (isFirstLaunch) {
      prefs.setBool('firstLaunch', false); // Update the flag
      _navigateToLanguageScreen();
    } else {
      // Otherwise, navigate to the HomeScreen
      _navigateToHomeScreen();
    }
  }

  void _navigateToLanguageScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    // Navigate to the language selection screen
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LanSelect()),
    );
  }

  void _navigateToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    // Navigate to the HomeScreen
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double scale = MediaQuery.of(context).textScaleFactor *
        12; // Use textScaleFactor for font scaling

    return Scaffold(
      // Customize your splash screen UI here
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(right: width / 2),
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
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.16),
                child: Center(
                  child: Text(
                    "NETRA",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: scale * 3,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.21),
                child: Center(
                  child: Text(
                    "An eye on Leaves",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.03,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 2),
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
