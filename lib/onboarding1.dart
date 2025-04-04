import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'CORE/CONSTANTS.dart';
import 'onboarding2.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.06), // 6% من عرض الشاشة كـ Padding
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.06), // 6% من ارتفاع الشاشة
            SizedBox(
              width: double.infinity,
              child: Text(
                'Skip',
                textAlign: TextAlign.end,
                style: Styles.textStyle16.copyWith(decoration: TextDecoration.none),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // 2% من ارتفاع الشاشة
            Image.asset(
              'asset/img_1.png',
              width: screenWidth * 0.9, // 90% من عرض الشاشة
              height: screenHeight * 0.4, // 40% من ارتفاع الشاشة
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              width: double.infinity,
              child: Text(
                'Welcome To Medi Report',
                textAlign: TextAlign.center,
                style: Styles.textStyle24.copyWith(decoration: TextDecoration.none),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            SizedBox(
              width: screenWidth * 0.9,
              height: screenHeight * 0.1, // 10% من ارتفاع الشاشة
              child: Text(
                'Your Medical journey begins here. Embark on a journey of health wellness with us.',
                maxLines: 3,
                textAlign: TextAlign.center,
                style: Styles.textStyle18.copyWith(decoration: TextDecoration.none),
              ),
            ),
            SizedBox(height: screenHeight * 0.04), // 4% من ارتفاع الشاشة
            Center(
              child: SizedBox(
                width: screenWidth * 0.9, // 90% من عرض الشاشة
                height: screenHeight * 0.06, // 6% من ارتفاع الشاشة
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 600),
                        reverseDuration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: Onboarding2(),
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
                    "Next",
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
    );
  }
}
