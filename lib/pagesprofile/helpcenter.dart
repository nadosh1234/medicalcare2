import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // يضمن محاذاة النص في المنتصف
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'asset/img_15.png',
                        width: screenWidth * 0.06,
                        height: screenWidth * 0.06,
                      ),
                    ),
                    Expanded(
                      child: Center( // يجعل النص دائمًا في المنتصف
                        child: Text(
                          "FAQ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "Welcome to the Medi Report Help Center! We're here to ensure you have the best experience with our app. Below, you'll find answers to frequently asked questions and ways to contact us for additional support.",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildSectionTitle("How does the app work?", screenWidth),
                _buildBulletPoint(
                  "The app allows you to upload your medical test results for interpretation using advanced technology, helping you better understand your health condition.",
                  screenWidth,
                ),
                _buildSectionTitle("Can I rely on the app instead of a doctor?", screenWidth),
                _buildBulletPoint(
                  "No, the app provides guidance only and is not a substitute for professional medical consultation. Always consult your doctor for accurate medical decisions.",
                  screenWidth,
                ),
                _buildSectionTitle("Is my data secure?", screenWidth),
                _buildBulletPoint(
                  "Yes, we use strong encryption and advanced security measures to ensure the privacy and safety of your data. For more details, check our [Privacy Policy].",
                  screenWidth,
                ),
                _buildSectionTitle("How can I share my results with my doctor?", screenWidth),
                _buildBulletPoint(
                  "You can share your test results via the \"Share with Doctor\" option in the app, allowing your doctor to easily access the interpretation.",
                  screenWidth,
                ),
                _buildSectionTitle("What should I do if I encounter a technical issue?", screenWidth),
                _buildBulletPoint(
                  "If you experience an issue, try updating the app or restarting it. If the problem persists, please contact our support team.",
                  screenWidth,
                ),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // يمكنك إضافة الأكشن المطلوب هنا لزر "Contact Us"
                    },
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(top: screenWidth * 0.03, bottom: screenWidth * 0.02),
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.045,
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
          Text(
            "• ",
            style: TextStyle(fontSize: screenWidth * 0.04),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
