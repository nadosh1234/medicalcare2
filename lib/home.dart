import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // 📌 الحصول على أبعاد الشاشة
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(screenWidth * 0.04), // 4% من عرض الشاشة كـ Padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 قسم الترحيب بالمستخدم
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage('asset/img_20.png'), // صورة المستخدم
                    radius: screenWidth * 0.05, // جعل الحجم ديناميكي
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Hello, ',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                              text: 'Laila!',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Welcome back!',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.notifications_none, color: Color(0xff12867A)),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              /// 🔹 كارد تحليل النتائج
              Card(
                color: Colors.teal[100],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Analyze your medical results easily and accurately!",
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            const Text(
                              "Simple medical test interpretation with approved standards.",
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff12867A)),
                              onPressed: () {},
                              child: const Text("Start Now", style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'asset/img_21.png',
                        width: screenWidth * 0.4, // 40% من عرض الشاشة
                        height: screenHeight * 0.15, // 15% من ارتفاع الشاشة
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              /// 🔹 العنوان الرئيسي للميزات
              const Text(
                "Features",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: screenHeight * 0.015),

              /// 🔹 عرض الميزات في شبكة
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 600 ? 3 : 2, // تغيير عدد الأعمدة حسب عرض الشاشة
                  crossAxisSpacing: screenWidth * 0.03,
                  mainAxisSpacing: screenHeight * 0.02,
                  childAspectRatio: 1.5,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  List features = [
                    {"image": "asset/img_22.png", "text": "Instant interpretation of test results"},
                    {"image": "asset/img_25.png", "text": "Based on reliable medical values"},
                    {"image": "asset/img_26.png", "text": "Easy-to-use interface"},
                    {"image": "asset/img_27.png", "text": "Supports various types of tests"},
                  ];
                  return _featureCard(features[index]["image"], features[index]["text"]);
                },
              ),

              SizedBox(height: screenHeight * 0.03),

              /// 🔹 التعليمات
              const Text(
                "Instructions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: screenHeight * 0.01),
              const Text(
                "How to Prepare for a Blood Test?",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: screenHeight * 0.01),
              _instructionItem("Fasting if Required: Some tests, such as fasting blood sugar and cholesterol, require fasting for 8-12 hours before the test."),
              _instructionItem("Avoid Certain Medications: Some medications can affect test results, so consult your doctor about temporarily stopping them if necessary."),
              _instructionItem("Stay Hydrated: Drinking enough water helps with blood circulation."),
            ],
          ),
        ),
      ),
    );
  }

  /// 📌 مكون بطاقة الميزة (Feature Card)
  Widget _featureCard(String imagePath, String text) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = MediaQuery.of(context).size.width; // عرض الشاشة
        double screenHeight = MediaQuery.of(context).size.height; // ارتفاع الشاشة

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.015, // التكيف مع ارتفاع الشاشة
            horizontal: screenWidth * 0.04, // التكيف مع عرض الشاشة
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // 🔹 يجعل الكولوم تتكيف مع المحتوى فقط
            children: [
              /// 🟢 الصورة متجاوبة مع حجم الشاشة
              Flexible(
                child: SizedBox(
                  height: screenWidth * 0.12, // نسبة من عرض الشاشة
                  width: screenWidth * 0.12,
                  child: FittedBox(
                    child: Image.asset(imagePath),
                  ),
                ),
              ),
              const SizedBox(height: 8), // مسافة ثابتة
              Flexible(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.028, // حجم الخط متجاوب
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }




  /// 📌 مكون عنصر التعليمات
  Widget _instructionItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 20.0)),
          const SizedBox(width: 2),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}
