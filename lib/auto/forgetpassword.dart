import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../CORE/showsnack.dart';
import 'Login.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  /// ✅ **دالة إعادة تعيين كلمة المرور**
  Future<void> resetPassword() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      showSnackBar(context, "Password reset email sent successfully.");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "Error: ${e.message}");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.05),
            children: [
              SizedBox(height: screenHeight * 0.05),

              /// ✅ **الصورة (نسبة لحجم الشاشة)**
              Center(
                child: Image.asset(
                  'asset/img_19.png',
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.2,
                ),
              ),

              /// ✅ **العنوان الرئيسي**
              Center(
                child: Text(
                  'Verification',
                  style: TextStyle(
                    color: const Color(0xff12867A),
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.06,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.05),

              /// ✅ **حقل إدخال البريد الإلكتروني (متجاوب)**
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) {
                  return email!.contains(RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
                      ? null
                      : "Enter a valid email";
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey, size: 20),
                  labelStyle: TextStyle(color: const Color(0xffC8C8C8), fontSize: screenWidth * 0.04),
                  border: OutlineInputBorder(borderSide: const BorderSide(color: Color(0xff12867A))),
                ),
              ),

              SizedBox(height: screenHeight * 0.05),

              /// ✅ **زر إرسال رابط إعادة التعيين (متجاوب)**
              SizedBox(
                width: screenWidth * 0.9,
                height: screenHeight * 0.06,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await resetPassword();
                    } else {
                      showSnackBar(context, "Invalid email address.");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff12867A),
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                    "Send",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: const Color(0xffFFFFFF),
                      fontWeight: FontWeight.w400,
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
