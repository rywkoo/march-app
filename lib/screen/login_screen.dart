import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/screen/main_screen.dart';
import 'package:test1/screen/signup_screen.dart';
import '../helper/social_button.dart';
import '../helper/style.dart';
import '../helper/pos_textform_field.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleColor.filledBackground,
      body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
          opacity: 0.2, // 👈 50% transparent
        ),
      ),

        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(height: 200),

              // Title
              Container(
                width: double.infinity, // <-- full width
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: StyleColor.filledBackground.withOpacity(1), // semi-transparent background
                  borderRadius: BorderRadius.circular(50),     // rounded corners
                ),
                child: Text(
                  "Login Here",
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: StyleColor.black,
                  ),
                  textAlign: TextAlign.center, // center the text
                ),
              ),


              const SizedBox(height: 40),

              // Email Field
              PosTextformField(
                controller: emailController,
                label: "Email",
                placeholder: "Enter your email",
                prefixIcon: const Icon(Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required!";
                  }
                  final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!regex.hasMatch(value)) {
                    return "Enter a valid email!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password Field
              PosTextformField(
                controller: passwordController,
                label: "Password",
                placeholder: "Enter your password",
                obscureText: _isPassword,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPassword = !_isPassword;
                    });
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required!";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),

              // Forgot Password
              
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: StyleColor.black.withOpacity(1), // background color
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // optional padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50), // rounded corners
                    ),
                  ),
                  child: Text(
                    "Forgot Your Password?",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: StyleColor.filledBackground,
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 20),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: StyleColor.filledBackground,
                  shadowColor: StyleColor.black.withOpacity(0.25),
                  elevation: 15,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: StyleColor.black,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Sign up link
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: StyleColor.black.withOpacity(1), // background color
                      borderRadius: BorderRadius.circular(50), // rectangle with rounded corners
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: StyleColor.filledBackground,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero, // so it doesn’t add extra spacing
                            minimumSize: Size(0, 0), // shrink to fit
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: StyleColor.filledBackground,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
