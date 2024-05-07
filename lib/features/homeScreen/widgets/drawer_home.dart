import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netra/core/theme/appTheme.dart';
import 'package:netra/features/languageselect/screens/lan_select.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double scale = MediaQuery.of(context).textScaleFactor * 12;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
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
                      fontSize: scale * 4,
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
              ],
            ),
          ),
          ListTile(
            tileColor: AppTheme.primaryColor.shade100,
            title: Text('Select Language'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LanSelect()));
            },
          ),
          SizedBox(
          
            height: height*0.01,

          ),
          ListTile(
          tileColor:AppTheme.primaryColor.shade100,
            title: Text('Item 2'),
            onTap: () {
              // Update UI based on the selected item
            },
          ),
          // Add more ListTiles for additional items in the drawer
        ],
      ),
    );
  }
}
