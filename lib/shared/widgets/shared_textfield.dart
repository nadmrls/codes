import 'package:flutter/material.dart';
import 'package:personal_company/app/utils/app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final Icon prefix_icon;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    required this.prefix_icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      // For password visibility toggle
      style: TextStyle(
        fontSize: 16,
        color: Colors.black, // Replace with your text color
      ),
      decoration: InputDecoration(
        prefixIcon: prefix_icon,
        filled: true,
        fillColor: AppColors.textFieldBG, // Set background color
        hintText: hintText, // This is the placeholder text
        hintStyle: TextStyle(
          color:
              const Color.fromARGB(255, 128, 128, 128), // Set hint text color
        ),
        labelText:
            hintText, // This makes the hint text act as a label when the text field is focused
        labelStyle: TextStyle(
          color: const Color.fromARGB(255, 128, 128, 128), // Label text color
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 15, vertical: 10), // Padding inside the text field
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Set border radius
          borderSide: BorderSide(
            color: AppColors.primaryColor, // Set border color
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(12), // Set border radius when focused
          borderSide: BorderSide(
            color: AppColors.primaryColor, // Set focused border color
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Set border radius
          borderSide: BorderSide(
            color: AppColors.primaryColor, // Default border color
            width: 1,
          ),
        ),
        floatingLabelBehavior:
            FloatingLabelBehavior.auto, // Label floats when the user types
      ),
    );
  }
}
