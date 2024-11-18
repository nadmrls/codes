import 'package:flutter/material.dart';
import 'package:personal_company/app/routes/app_routes.dart';
import 'package:personal_company/app/utils/app_color.dart';
import 'package:personal_company/app/utils/app_string.dart';
import 'package:personal_company/app/utils/app_text_style.dart';
import 'package:personal_company/shared/widgets/shared_button.dart';
import 'package:personal_company/shared/widgets/shared_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void create_account(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signup_screen);
  }

  void login(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                  margin: EdgeInsets.only(bottom: 200),
                  color: AppColors.primaryColor,
                  height: 40,
                  width: double.infinity,
                ),
                Container(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.login_screen_text1,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.initial_screen_text_one,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        AppStrings.login_screen_text2,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.login_screen_text_two,
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
                        controller: usernameController,
                        hintText: 'Email',
                        prefix_icon: Icon(Icons.person_outline_rounded,
                            color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Password',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                AppStrings.forgot_pass,
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
                        button_text: AppStrings.login_button,
                        onPressed: () => login(context),
                        bg_color: AppColors.primaryColor,
                        text_color: AppColors.color_white,
                        size: 70,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () => create_account(context),
                          child: Text(
                            AppStrings.create_acc,
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
