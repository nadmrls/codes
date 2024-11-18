import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:personal_company/app/routes/app_routes.dart';
import 'package:personal_company/app/utils/app_color.dart';
import 'package:personal_company/app/utils/app_string.dart';
import 'package:personal_company/app/utils/app_text_style.dart';
import 'package:personal_company/shared/widgets/logout_container.dart';
import 'package:personal_company/shared/widgets/shared_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _timeString = '';
  String _dateString = '';
  bool timed_in = true;
  bool time_out = true;
  bool overtime = false;

  @override
  void initState() {
    super.initState();
    _updateTime();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = DateFormat('hh:mm:ss a').format(now);
    final String formattedDate = DateFormat('MMMM dd, yyyy').format(now);
    setState(() {
      _timeString = formattedTime;
      _dateString = formattedDate;
    });
  }

  void toggleOvertime() {
    setState(() {
      overtime = !overtime;
    });
  }

  void timein() {
    print('IN TIME: $_timeString');
    print('IN TIME: $_dateString');
  }

  void timeout() {
    print('OUT TIME: $_timeString');
    print('OUT DATE: $_dateString');
  }

  void timein_OT() {
    print('IN TIME: $_timeString');
    print('IN TIME: $_dateString');
  }

  void timeout_OT() {
    print('OUT TIME: $_timeString');
    print('OUT DATE: $_dateString');
  }

  void rqst() {
    print('REQUEST OT');
  }

  void logout(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.login_screen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoutContainer(
                action: () => logout(context),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.textFieldBG,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.home_screen_text1,
                          style: AppTextStyles.home_screen_style1,
                        ),
                        Column(
                          children: [
                            Text(
                              AppStrings.home_screen_text2,
                              style: AppTextStyles.home_screen_style1,
                            ),
                            Text(
                              'null',
                              style: AppTextStyles.home_screen_style1,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              AppStrings.home_screen_text3,
                              style: AppTextStyles.home_screen_style1,
                            ),
                            Text(
                              'null',
                              style: AppTextStyles.home_screen_style1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SharedButton(
                          button_text: 'Time IN today',
                          onPressed: () => timein(),
                          bg_color: timed_in
                              ? AppColors.primaryColor
                              : AppColors.color_grey,
                          size: 0,
                          text_color: AppColors.color_white,
                        ),
                        SharedButton(
                          button_text: 'Time OUT today',
                          onPressed: () => timeout(),
                          bg_color: time_out
                              ? AppColors.color_white
                              : AppColors.color_grey,
                          size: 0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //request of OT time
              Container(
                decoration: BoxDecoration(
                    color: AppColors.textFieldBG,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: overtime
                    ? Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.home_screen_text4,
                                style: AppTextStyles.home_screen_style1,
                              ),
                              Column(
                                children: [
                                  Text(
                                    AppStrings.home_screen_text5,
                                    style: AppTextStyles.home_screen_style1,
                                  ),
                                  Text(
                                    'null',
                                    style: AppTextStyles.home_screen_style1,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    AppStrings.home_screen_text6,
                                    style: AppTextStyles.home_screen_style1,
                                  ),
                                  Text(
                                    'null',
                                    style: AppTextStyles.home_screen_style1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SharedButton(
                                button_text: 'Time IN today',
                                onPressed: () => timein_OT(),
                                bg_color: timed_in
                                    ? AppColors.primaryColor
                                    : AppColors.color_grey,
                                size: 0,
                                text_color: AppColors.color_white,
                              ),
                              SharedButton(
                                button_text: 'Time OUT today',
                                onPressed: () => timeout_OT(),
                                bg_color: time_out
                                    ? AppColors.color_white
                                    : AppColors.color_grey,
                                size: 0,
                              ),
                            ],
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            AppStrings.home_screen_rqstOT,
                            style: AppTextStyles.home_screen_style1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SharedButton(
                            button_text: 'REQUEST OT!',
                            onPressed: () => rqst(),
                            bg_color: AppColors.primaryColor,
                            text_color: AppColors.color_white,
                          )
                        ],
                      ),
              ),

              Container(
                decoration: BoxDecoration(
                    color: AppColors.textFieldBG,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: const Column(
                  children: [
                    Text(
                      "Today's total working hours:",
                      style: AppTextStyles.home_screen_style2,
                    ),
                    Divider(
                      color: AppColors.primaryColor,
                    ),
                    const Column(
                      children: [
                        Text(
                          'Hours Done:',
                          style: AppTextStyles.home_screen_style1,
                        ),
                        Text(
                          'null',
                          style: AppTextStyles.home_screen_style1,
                        )
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Text(
                      "This month's total working hours:",
                      style: AppTextStyles.home_screen_style2,
                    ),
                    Divider(
                      color: AppColors.primaryColor,
                    ),
                    const Column(
                      children: [
                        Text(
                          'Hours Done:',
                          style: AppTextStyles.home_screen_style1,
                        ),
                        Text(
                          'null',
                          style: AppTextStyles.home_screen_style1,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.textFieldBG,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.all(10),
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
