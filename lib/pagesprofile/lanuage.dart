import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = "English (US)";

  final List<String> suggestedLanguages = ["English (US)", "English (UK)"];
  final List<String> otherLanguages = [
    "Mandarin", "Hindi", "Spanish", "French", "Arabic",
    "Russian", "Indonesian", "Vietnamese"
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.08),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'asset/img_15.png',
                    width: screenWidth * 0.06, // Responsive icon size
                    height: screenWidth * 0.06, // Responsive icon size
                  ),
                ),
                Spacer(),
                Text(
                  "Language",
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
            buildSectionTitle("Suggested", screenWidth),
            ...suggestedLanguages.map((lang) => buildRadioTile(lang, screenWidth)).toList(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              child: Divider(
                thickness: 1,
                color: Colors.grey.shade400,
              ),
            ),
            buildSectionTitle("Others", screenWidth),
            ...otherLanguages.map((lang) => buildRadioTile(lang, screenWidth)).toList(),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.045,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildRadioTile(String language, double screenWidth) {
    return RadioListTile<String>(
      title: Text(
        language,
        style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500),
      ),
      value: language,
      controlAffinity: ListTileControlAffinity.trailing,
      groupValue: selectedLanguage,
      visualDensity: VisualDensity(vertical: -3),
      activeColor: Colors.teal,
      onChanged: (value) {
        setState(() {
          selectedLanguage = value!;
        });
      },
    );
  }
}

