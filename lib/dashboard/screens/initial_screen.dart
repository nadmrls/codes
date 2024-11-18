import 'package:flutter/material.dart';
import 'package:personal_company/app/routes/app_routes.dart';
import 'package:personal_company/app/utils/app_color.dart';
import 'package:personal_company/app/utils/app_text_style.dart';
import 'package:personal_company/shared/widgets/shared_button.dart';
import 'package:personal_company/app/utils/app_string.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  void Login_button(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.login_screen);
  }

  void Signup_button(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signup_screen);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          color: AppColors.primaryColor,
          height: 40,
          width: double.infinity,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                color: AppColors.primaryColor,
                height: 40,
                width: double.infinity,
              ),
              Container(
                margin: EdgeInsets.only(top: 150, left: 10, right: 10),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/image/initial_screen_image.png',
                      width: 400,
                      height: 300,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                            AppStrings.Text_one_initial_screen,
                            style: AppTextStyles.initial_screen_text_one,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                            AppStrings.Text_two_initial_screen,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.initial_screen_text_two,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SharedButton(
                          button_text: AppStrings.login_button,
                          onPressed: () => Login_button(context),
                          bg_color: AppColors.primaryColor,
                          text_color: AppColors.color_white,
                        ),
                        SharedButton(
                          button_text: AppStrings.signup_button,
                          onPressed: () => Signup_button(context),
                          bg_color: AppColors.color_white,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
