
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../CORE/showsnack.dart';
import 'Login.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool isVisibility = true;
  final _formKey = GlobalKey<FormState>();

  register() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred, please try again.";
      if (e.code == 'weak-password') {
        errorMessage = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        errorMessage = "The account already exists for that email.";
      }
      showSnackBar(context, errorMessage);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Image.asset('asset/img_19.png',
                width: screenWidth * 0.35, height: screenWidth * 0.35),
            Center(
                child: Text('Sign Up',
                    style: TextStyle(
                        color: Color(0xff12867A),
                        fontWeight: FontWeight.w600,
                        fontSize: 24))),
            Center(
                child: Text('Please fill your details',
                    style: TextStyle(
                        color: Color(0xff12867A),
                        fontWeight: FontWeight.w500,
                        fontSize: 12))),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _buildTextField(
                      controller: usernameController,
                      label: 'Name',
                      icon: Icons.person),
                  SizedBox(height: 15),
                  _buildTextField(
                      controller: emailController,
                      label: 'Email',
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) => email!.contains(
                          RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
                          ? null
                          : "Enter a valid email"),
                  SizedBox(height: 15),
                  _buildTextField(
                      controller: passwordController,
                      label: 'Password',
                      icon: Icons.lock,
                      obscureText: isVisibility,
                      suffixIcon: IconButton(
                        icon: Icon(isVisibility
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isVisibility = !isVisibility;
                          });
                        },
                      )),
                  SizedBox(height: 30),
                  _buildButton(
                    text: "Sign Up",
                    color: Color(0xff12867A),
                    textColor: Colors.white,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await register();
                      } else {
                        showSnackBar(context, "Please check your inputs.");
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  _buildButton(
                    text: "Sign In",
                    color: Colors.white,
                    textColor: Color(0xff12867A),
                    borderColor: Color(0xff12867A),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  Text('Or Continue with',
                      style:
                      TextStyle(color: Color(0xff747373), fontSize: 12)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon('asset/img_11.png'),
                      SizedBox(width: 10),
                      _buildSocialIcon('asset/google.png'),
                      SizedBox(width: 10),
                      _buildSocialIcon('asset/img_12.png'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
        required String label,
        required IconData icon,
        TextInputType keyboardType = TextInputType.text,
        bool obscureText = false,
        Widget? suffixIcon,
        String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff12867A))),
        labelText: label,
        labelStyle: TextStyle(color: Color(0xffC8C8C8), fontSize: 16),
        prefixIcon: Icon(icon, color: Colors.grey, size: 16),
        suffixIcon: suffixIcon,
      ),
    );
  }

  Widget _buildButton(
      {required String text,
        required Color color,
        required Color textColor,
        VoidCallback? onPressed,
        Color? borderColor}) {
    return SizedBox(
      width: double.infinity,
      height: 51,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          side: borderColor != null ? BorderSide(color: borderColor) : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text(text, style: TextStyle(fontSize: 16, color: textColor)),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.asset(assetPath, width: 30, height: 30),
      ),
    );
  }
}