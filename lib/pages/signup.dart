import 'package:flutter/material.dart';

import 'package:homesync/pages/Reuseable.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  bool isSigningUp = false;
  bool isPasswordVisible = false;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 38, 50, 56)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.grey[100],
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 36, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
            child: Column(
              children: <Widget>[
                logowidget("assets/signup.png"),
                const SizedBox(height: 5),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Email ID",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                const SizedBox(height: 20),
                PasswordTextField(
                  text: "Enter Password",
                  icon: Icons.lock_outline,
                  controller: _passwordTextController,
                ),
                const SizedBox(height: 20),
                firebaseUIButton(context, "Sign Up", () {
                  // Navigate to the next route on button press
                  Navigator.pushReplacementNamed(context, '/onboarding');
                }),
                firebaseUIButton(
                  context,
                  'Sign Up With Google',
                  () {
                    // Navigate to the next route on button press
                    Navigator.pushReplacementNamed(context, '/onboarding');
                  },
                  Icon(Icons.account_circle, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
