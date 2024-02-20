import 'package:flutter/material.dart';
import 'package:netra/core/theme/appTheme.dart';
import 'package:netra/features/homeScreen/screens/homeScreen.dart';

class LanSelect extends StatefulWidget {
  @override
  _LanSelectState createState() => _LanSelectState();
}

class _LanSelectState extends State<LanSelect> {
  @override
  void initState() {
    super.initState();
    // Simulate a long loading process to display the splash screen for a certain duration
    // _navigateToMainScreen();
  }

  void _navigateToMainScreen() async {
     // Change the duration as needed
    // Navigate to the main screen after the splash screen duration
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => PredictionScreen()),
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
          Padding(
           padding: EdgeInsets.only(top: height/20,),
           child: Container(
            child: Column(
              children: [
                Image.asset(
                "assets/images/lang.png",
                height: height/4,
                fit: BoxFit.fill,
                // Adjust as needed
              ),
              ],
            ),
           
           ),
         ),
         Padding(
           padding: EdgeInsets.only(top: height/12,),
           child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed:(){
                     _navigateToMainScreen(); 
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      shadowColor: Colors.grey[600],
                      elevation: 5,
                      
                      ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:width*0.07, vertical:height*0.025, ),
                      child: Text("Hindi",
                      style: TextStyle(
                        color: AppTheme.whiteColor,
                        fontSize: scale*2,
                        
                        ),
                        
                        ),
                    )),
                    ElevatedButton(onPressed:(){
                     _navigateToMainScreen(); 
                    },
                    style: ElevatedButton.styleFrom(
                      
                      backgroundColor: AppTheme.primaryColor,
                      shadowColor: Colors.grey[600],
                      elevation: 5,
                      
                      ),
                     child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:width*0.04, vertical:height*0.025, ),
                      child: Text("English",

                            style: TextStyle(
                              color: AppTheme.whiteColor,
                              fontSize: scale*2,
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
           padding: EdgeInsets.only(left: width/2,top: height*0.0242,),
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
  
  language1() {}
}
