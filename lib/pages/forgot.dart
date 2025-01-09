import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homesync/pages/Reuseable.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 38, 50, 56)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Forget Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[100]),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 36, color: Colors.grey[100]),
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
                logowidget("assets/forgotpassword.png"),
                const SizedBox(height: 5),
                const SizedBox(height: 20),
                reusableTextField("Enter Email ID", Icons.person_outline, false, _emailTextController),
                const SizedBox(height: 20),
                firebaseUIButton(
                  context,
                  'Get Link On Email',
                  () {
                    // Handle the button press, e.g., show a message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Link sent to ${_emailTextController.text}'),
                      ),
                    );
                  },
                  Icon(FontAwesomeIcons.envelope, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
