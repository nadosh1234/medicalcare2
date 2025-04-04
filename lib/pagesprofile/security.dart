import 'package:flutter/material.dart';

class SecurityPrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.015),
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
                      "Security & Privacy",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05, // Responsive font size
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "At Medi Report, we prioritize the security and privacy of your health data. We use the latest technologies to protect your information from unauthorized access or breaches.",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035, // Responsive font size
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                _buildSectionTitle("Data Encryption", screenWidth),
                _buildSectionBody(
                    "All data is encrypted using advanced security protocols (AES-256, SSL/TLS) during transmission and storage.",
                    screenWidth),
                _buildSectionTitle("Identity Verification", screenWidth),
                _buildSectionBody(
                    "We offer Two-Factor Authentication (2FA) to secure your account from unauthorized access.\nSecurity alerts are sent to notify you of any suspicious activity.",
                    screenWidth),
                _buildSectionTitle("Data Access Control", screenWidth),
                _buildSectionBody(
                    "Your data is accessible only to you and is never shared with third parties without your consent.\nYou can manage who has access to your test results and securely share them with your doctor.",
                    screenWidth),
                _buildSectionTitle("Compliance with International Standards", screenWidth),
                _buildSectionBody(
                    "We adhere to HIPAA (USA) and GDPR (EU) regulations to ensure the highest level of data protection.",
                    screenWidth),
                _buildSectionTitle("Backup & Recovery", screenWidth),
                _buildSectionBody("Secure backups are performed regularly to prevent data loss.", screenWidth),
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

  Widget _buildSectionBody(String body, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.03),
      child: Text(
        body,
        style: TextStyle(
          fontSize: screenWidth * 0.035, // Responsive font size
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
