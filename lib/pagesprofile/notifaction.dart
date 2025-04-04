import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.10),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'asset/img_15.png',
                    width: screenWidth * 0.10, // Responsive size
                    height: screenWidth * 0.06, // Responsive size
                  ),
                ),
                Spacer(),
                Text(
                  "Notification",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05, // Responsive font size
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Image.asset(
              'asset/img_17.png',
              width: screenWidth * 0.9, // Responsive width
              height: screenHeight * 0.4, // Responsive height
              fit: BoxFit.contain,
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Text(
                "No Notification Yet",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.06, // Responsive font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}