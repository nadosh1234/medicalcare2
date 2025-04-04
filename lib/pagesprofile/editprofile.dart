import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController(text: "ali");
  final TextEditingController lastNameController = TextEditingController(text: "mohamed");
  final TextEditingController phoneController = TextEditingController(text: "+20 123 456 7891");
  final TextEditingController emailController = TextEditingController(text: "ali_mohamed@gmail.com");
  final TextEditingController countryController = TextEditingController(text: "egypt");
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: screenWidth * 0.02),
                Row(
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
                      child: Center(
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.06), // مساحة توازن الزر
                  ],
                ),
                SizedBox(height: screenWidth * 0.06),
                _buildTextField("First Name", Icons.person, firstNameController, screenWidth),
                _buildTextField("Last Name", Icons.person, lastNameController, screenWidth),
                _buildTextField("Phone Num", Icons.phone, phoneController, screenWidth),
                _buildTextField("Email", Icons.email, emailController, screenWidth),
                _buildTextField("Country", Icons.language, countryController, screenWidth),
                _buildPasswordField("Password", passwordController, screenWidth),
                _buildPasswordField("New Password", newPasswordController, screenWidth),
                SizedBox(height: screenWidth * 0.05),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission
                    }
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, screenWidth * 0.13),
                    backgroundColor: Color(0xff12867A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
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

  Widget _buildTextField(String label, IconData icon, TextEditingController controller, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: TextFormField(
        controller: controller,
        obscureText: _obscurePassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }
}