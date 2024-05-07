import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netra/core/theme/appTheme.dart';

class CustomTimelineTile extends StatelessWidget {
  String image1 = "assets/icons/plant.png";
  String image2 = "assets/icons/camera.png";
  String image3 = "assets/icons/getSolution.png";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Image.asset(image1, height: 100, width: 100),
            Text(
              "selectAffectedCrop".tr,
              style: GoogleFonts.montserrat(
                  fontSize: width * 0.043,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.primaryColor),
            )
          ],
        ),
        _buildArrowIcon(),
        Row(
          children: [
            Image.asset(image2, height: 100, width: 100),
            Text(
              "uploadCropPhoto".tr,
              style: GoogleFonts.montserrat(
                  fontSize: width * 0.043,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.primaryColor),
            )
          ],
        ),
        _buildArrowIcon(),
        Row(
          children: [
            Image.asset(image3, height: 100, width: 100),
            Text(
              "getSolution".tr,
              style: GoogleFonts.montserrat(
                  fontSize: width * 0.043,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.primaryColor),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildArrowIcon() {
    return const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 23.0),
          child: Image(image: AssetImage("assets/icons/arrow.png")),
        ));
  }
}
