import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homesync/pages/Reuseable.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

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
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(0, 249, 228, 209),
        child: Column(
          children: <Widget>[
            logowidget("assets/login.png"),
            reusableTextField(
              "Enter Email ID",
              Icons.person_outline,
              false,
              _emailTextController,
            ),
            const SizedBox(height: 15),
            PasswordTextField(
              text: "Enter Password",
              icon: Icons.lock_outline,
              controller: _passwordTextController,
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                // Navigate to the forgot password page
                Navigator.pushNamed(context, '/forget');
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            firebaseUIButton(
              context,
              'Login',
              () {
                // Navigate to home page after login
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            firebaseUIButton(
              context,
              'Sign In With Google',
              () {
                // Navigate to home page after Google sign-in
                Navigator.pushReplacementNamed(context, '/home');
              },
              const Icon(FontAwesomeIcons.google, color: Colors.white),
            ),
            signUpOption(),
          ],
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to sign-up page
            Navigator.pushReplacementNamed(context, '/signup');
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
