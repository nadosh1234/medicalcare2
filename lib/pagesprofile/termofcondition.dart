import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03), // Responsive padding
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.01),
                Row(
                  children: [
                    SizedBox(width: screenWidth * 0.04),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'asset/img_15.png',
                        width: screenWidth * 0.06, // Responsive size
                        height: screenWidth * 0.06, // Responsive size
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Terms & Conditions",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05, // Responsive font size
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Welcome to Medi Report, an application designed to analyze and interpret medical test results. Please read these Terms & Conditions carefully before using the app. By using it, you agree to all the terms outlined below.",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035, // Responsive font size
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                _buildSectionTitle("Acceptance of Terms", screenWidth),
                _buildBulletPoint(
                    "By accessing and using this app, you agree to comply with these Terms & Conditions. If you do not agree with any part of them, please refrain from using the app.",
                    screenWidth),
                _buildSectionTitle("Purpose of the App", screenWidth),
                _buildBulletPoint(
                    "This app provides guidance and interpretations of medical test results but does not replace professional medical consultation.",
                    screenWidth),
                _buildBulletPoint(
                    "You should not make medical decisions solely based on the app’s information without consulting your doctor.",
                    screenWidth),
                _buildSectionTitle("Data Protection & Privacy", screenWidth),
                _buildBulletPoint(
                    "We are committed to protecting your privacy according to our security policies. For more details, please review our [Privacy Policy].",
                    screenWidth),
                _buildBulletPoint(
                    "Your data will not be shared with third parties without your consent.",
                    screenWidth),
                _buildSectionTitle("Permitted Use", screenWidth),
                _buildBulletPoint(
                    "You may use the app solely for personal and legitimate medical purposes.",
                    screenWidth),
                _buildBulletPoint(
                    "Any misuse of the app, including providing false data, attempting to hack the system, or using it for unlawful activities, is strictly prohibited.",
                    screenWidth),
                _buildSectionTitle("Limitation of Liability", screenWidth),
                _buildBulletPoint(
                    "We strive to ensure the accuracy of the information provided but do not guarantee it is completely error-free or comprehensive.",
                    screenWidth),
                _buildBulletPoint(
                    "The app and its developers shall not be held responsible for any misuse or misinterpretation of the information provided.",
                    screenWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(top: screenWidth * 0.04, bottom: screenWidth * 0.02),
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.045, // Responsive font size
          fontWeight: FontWeight.w500,
          color: Color(0xff12867A),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.02, bottom: screenWidth * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: screenWidth * 0.04)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: screenWidth * 0.035, // Responsive font size
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
