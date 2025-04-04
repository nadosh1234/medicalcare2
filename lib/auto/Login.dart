import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:untitled12/auto/signin.dart';

import '../CORE/navigationbar.dart';
import '../CORE/showsnack.dart';
import 'forgetpassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool isVisibility = false;

  Future<void> signIn() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.push(
          context,
          PageTransition(
            duration: const Duration(milliseconds: 600),
            reverseDuration: const Duration(milliseconds: 300),
            type: PageTransitionType.leftToRightWithFade,
            child:  buttonbar(),
          ));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.code);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          children: [
            SizedBox(height: size.height * 0.02),
            Image.asset('asset/img_19.png', width: size.width * 0.4, height: size.height * 0.2),
            Center(
              child: Text(
                'Log In',
                style: TextStyle(color: const Color(0xff12867A), fontWeight: FontWeight.w600, fontSize: size.width * 0.06),
              ),
            ),
            Center(
              child: Text(
                'Please login to using app',
                style: TextStyle(color: const Color(0xff12867A), fontWeight: FontWeight.w500, fontSize: size.width * 0.03),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey, size: 16),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: isVisibility,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock, color: Colors.grey, size: 16),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisibility = !isVisibility;
                    });
                  },
                  icon: Icon(isVisibility ? Icons.visibility : Icons.visibility_off_outlined),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 600),
                      reverseDuration: const Duration(milliseconds: 300),
                      type: PageTransitionType.topToBottom,
                      child: const ForgetPassword(),
                    ),
                  );
                },
                child: Text('Forget password?', style: TextStyle(fontSize: size.width * 0.03, color: const Color(0xff12867A))),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            ElevatedButton(
              onPressed: () async {
                await signIn();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff12867A),
                padding: EdgeInsets.all(size.width * 0.03),
              ),
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text("Sign in", style: TextStyle(fontSize: size.width * 0.04, color: Colors.white)),
            ),
            SizedBox(height: size.height * 0.02),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    duration: const Duration(milliseconds: 600),
                    reverseDuration: const Duration(milliseconds: 300),
                    type: PageTransitionType.leftToRightWithFade,
                    child: const Signin(),
                  ),
                );
              },
              child: Text("Sign Up", style: TextStyle(fontSize: size.width * 0.04, color: const Color(0xff12867A))),
            ),
            SizedBox(height: size.height * 0.03),
            Center(child: Text('Or Continue with', style: TextStyle(color: Colors.grey, fontSize: size.width * 0.03))),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ['img_11.png', 'google.png', 'img_12.png']
                  .map((img) => Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Container(
                  width: size.width * 0.1,
                  height: size.width * 0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('asset/$img'),
                ),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
