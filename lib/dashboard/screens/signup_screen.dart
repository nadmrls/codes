import 'package:flutter/material.dart';
import 'package:personal_company/app/routes/app_routes.dart';
import 'package:personal_company/app/utils/app_color.dart';
import 'package:personal_company/app/utils/app_string.dart';
import 'package:personal_company/app/utils/app_text_style.dart';
import 'package:personal_company/shared/widgets/shared_button.dart';
import 'package:personal_company/shared/widgets/shared_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  void login_screen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.login_screen);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController create_usernameController =
        TextEditingController();
    final TextEditingController create_passwordController =
        TextEditingController();
    final TextEditingController create_password2Controller =
        TextEditingController();

    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          color: AppColors.primaryColor,
          height: 40,
          width: double.infinity,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight * 0.9553,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  AppColors.gradianet,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 150),
                  color: AppColors.primaryColor,
                  height: 40,
                  width: double.infinity,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.create_account_text1,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.initial_screen_text_one,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          AppStrings.create_account_text2,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.create_new_acc,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: create_usernameController,
                        hintText: 'Username',
                        prefix_icon: Icon(Icons.person_outline_rounded,
                            color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: create_passwordController,
                        hintText: 'Password',
                        prefix_icon: Icon(Icons.lock, color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: create_password2Controller,
                        hintText: 'Confirm Password',
                        prefix_icon: Icon(Icons.lock, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                AppStrings.show_pass,
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SharedButton(
                        button_text: AppStrings.create_acc,
                        onPressed: () {},
                        bg_color: AppColors.primaryColor,
                        text_color: AppColors.color_white,
                        size: 70,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () => login_screen(context),
                          child: Text(
                            AppStrings.create_account_text3,
                            style: AppTextStyles.create_new_acc,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
