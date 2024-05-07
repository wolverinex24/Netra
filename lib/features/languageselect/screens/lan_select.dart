import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netra/core/theme/appTheme.dart';
import 'package:netra/features/homeScreen/screens/homeScreen.dart';
import 'package:netra/features/languageselect/widgets/localization_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanSelect extends StatefulWidget {
  @override
  _LanSelectState createState() => _LanSelectState();
}

class _LanSelectState extends State<LanSelect> {
  String currentItem = "";

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage(); // Load selected language from SharedPreferences
  }

  void _loadCurrentLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? selectedLanguage = prefs.getString('language');
    if (selectedLanguage != null) {
      setState(() {
        currentItem = selectedLanguage;
      });
    }
  }

  void _navigateToMainScreen() {
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
          Padding(
            padding: EdgeInsets.only(
              top: height / 20,
            ),
            child: Container(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/lang.png",
                    height: height / 4,
                    fit: BoxFit.fill,
                    // Adjust as needed
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: height / 12,
            ),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            var locale = const Locale('hi', 'IN');
                            Get.updateLocale(locale);
                            currentItem = 'Hindi';
                            LocalizationService().changeLocale(currentItem);
                            _navigateToMainScreen();
                            // Save selected language to SharedPreferences
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setString('language', currentItem);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            shadowColor: Colors.grey[600],
                            elevation: 5,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.07,
                              vertical: height * 0.025,
                            ),
                            child: Text(
                              "Hindi",
                              style: TextStyle(
                                color: AppTheme.whiteColor,
                                fontSize: scale * 2,
                              ),
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () async {
                            var locale = const Locale('en', 'US');
                            Get.updateLocale(locale);
                            currentItem = 'English';
                            LocalizationService().changeLocale(currentItem);
                            _navigateToMainScreen();
                            // Save selected language to SharedPreferences
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setString('language', currentItem);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            shadowColor: Colors.grey[600],
                            elevation: 5,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.04,
                              vertical: height * 0.025,
                            ),
                            child: Text(
                              "English",
                              style: TextStyle(
                                color: AppTheme.whiteColor,
                                fontSize: scale * 2,
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width / 2,
              top: height * 0.0242,
            ),
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
