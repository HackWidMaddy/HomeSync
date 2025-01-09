import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;

  const PasswordTextField({
    Key? key,
    required this.text,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !isPasswordVisible,
      enableSuggestions: true,
      autocorrect: false,
      cursorColor: Colors.grey[100],
      style: TextStyle(color: Colors.grey[100]),
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey[100],
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey[100],
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        labelText: widget.text,
        labelStyle: TextStyle(color: Colors.grey[100]),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor:
            hexStringToColor("#FFB276").withOpacity(0.7), // Updated color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }
}

Color hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

Image logowidget(String imagename) {
  return Image.asset(
    imagename,
    fit: BoxFit.fitWidth,
    width: 350,
    height: 350,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.grey[100],
    style: TextStyle(color: Colors.grey[100]),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.grey[100],
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.grey[100]),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: hexStringToColor("#FFB276").withOpacity(0.7), // Updated color
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap,
    [Widget? leadingIcon]) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leadingIcon != null) leadingIcon,
          const SizedBox(width: 18),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(255, 38, 50, 56);
            }
            return Color.fromARGB(255, 38, 50, 56);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
