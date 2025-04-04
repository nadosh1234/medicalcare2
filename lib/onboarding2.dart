import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'CORE/CONSTANTS.dart';
import 'auto/Login.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.06), // 6% من عرض الشاشة كـ Padding
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02), // 2% من ارتفاع الشاشة
              Image.asset(
                'asset/img_6.png',
                width: screenWidth * 0.9, // 90% من عرض الشاشة
                height: screenHeight * 0.4, // 40% من ارتفاع الشاشة
              ),
              SizedBox(height: screenHeight * 0.04),
              Center(
                child: Container(
                  width: double.infinity,
                  child: Text(
                    'Let’s Take The First Step',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle24.copyWith(decoration: TextDecoration.none),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: screenWidth * 0.9,
                height: screenHeight * 0.1, // 10% من ارتفاع الشاشة
                child: Text(
                  'A place where technology meets compassion, and where the art of healing finds its truest expression.',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle18.copyWith(decoration: TextDecoration.none),
                ),
              ),
              SizedBox(height: screenHeight * 0.05), // 5% من ارتفاع الشاشة
              Center(
                child: SizedBox(
                  width: screenWidth * 0.9, // 90% من عرض الشاشة
                  height: screenHeight * 0.06, // 6% من ارتفاع الشاشة
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,    PageTransition(
                        duration: const Duration(milliseconds: 600),
                        reverseDuration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: Login(),
                      ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xff12867A)),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    child: Text(
                      "Get Started",
                      style: Styles.textStyle16.copyWith(
                        decoration: TextDecoration.none,
                        color: const Color(0xffFDFCFF),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
