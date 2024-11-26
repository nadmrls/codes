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
import 'package:personal_company/shared/widgets/shared_button_container.dart';

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
  bool darkmode = true;

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

  void toggleDarkMode() {
    setState(() {
      darkmode = !darkmode;
    });
  }

  void logout(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.login_screen);
  }

  void timein() {
    debugPrint('IN TIME: $_timeString');
    debugPrint('IN TIME: $_dateString');
  }

  void timeout() {
    debugPrint('OUT TIME: $_timeString');
    debugPrint('OUT DATE: $_dateString');
  }

  void timein_OT() {
    debugPrint('IN TIME: $_timeString');
    debugPrint('IN TIME: $_dateString');
  }

  void timeout_OT() {
    debugPrint('OUT TIME: $_timeString');
    debugPrint('OUT DATE: $_dateString');
  }

  void rqst() {
    debugPrint('REQUEST OT');
  }

  void press1() {
    debugPrint('REQUEST OT');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoutContainer(
                action2: () => toggleDarkMode(),
                action: () => logout(context),
                screen_mode: Icon(
                  darkmode ? Icons.dark_mode : Icons.light_mode,
                  color: darkmode
                      ? const Color.fromARGB(255, 243, 237, 219)
                      : Colors.amber,
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
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: screenWidth < 540 ? 30 : 40),
                width: double.infinity,
                child: screenWidth < 540
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SharedButtonContainer(
                                icon: Icon(
                                  Icons.flight_takeoff_rounded,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                title: AppStrings.custome_button_cont1,
                                onPressed: () => press1(),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SharedButtonContainer(
                                icon: Icon(
                                  Icons.watch_later_rounded,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                title: AppStrings.custome_button_cont2,
                                onPressed: () => press1(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SharedButtonContainer(
                                icon: Icon(
                                  Icons.local_cafe_rounded,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                title: AppStrings.custome_button_cont3,
                                onPressed: () => press1(),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SharedButtonContainer(
                                icon: Icon(
                                  Icons.attach_money_outlined,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                title: AppStrings.custome_button_cont4,
                                onPressed: () => press1(),
                              ),
                            ],
                          )
                        ],
                      )
                    : Row(
                        children: [
                          SharedButtonContainer(
                            icon: Icon(
                              Icons.flight_takeoff_rounded,
                              size: 40,
                              color: Colors.grey,
                            ),
                            title: AppStrings.custome_button_cont1,
                            onPressed: () => press1(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SharedButtonContainer(
                            icon: Icon(
                              Icons.watch_later_rounded,
                              size: 40,
                              color: Colors.grey,
                            ),
                            title: AppStrings.custome_button_cont2,
                            onPressed: () => press1(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SharedButtonContainer(
                            icon: Icon(
                              Icons.local_cafe_rounded,
                              size: 40,
                              color: Colors.grey,
                            ),
                            title: AppStrings.custome_button_cont3,
                            onPressed: () => press1(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SharedButtonContainer(
                            icon: Icon(
                              Icons.attach_money_outlined,
                              size: 40,
                              color: Colors.grey,
                            ),
                            title: AppStrings.custome_button_cont4,
                            onPressed: () => press1(),
                          ),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
