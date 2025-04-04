import 'package:flutter/material.dart';

import 'onboarding1.dart';


class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Onboarding1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'asset/img_9.png',
              width: screenWidth * 0.3, // 30% من عرض الشاشة
              height: screenHeight * 0.3, // 30% من ارتفاع الشاشة
            ),
          ),
          Center(
            child: Text(
              'BIO CHECK',
              style: TextStyle(
                fontSize: screenWidth * 0.08, // 8% من عرض الشاشة
                fontWeight: FontWeight.w400,
                color: const Color(0xff12867A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}