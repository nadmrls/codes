import 'package:flutter/material.dart';
import 'package:personal_company/app/routes/app_routes.dart';
import 'package:personal_company/shared/widgets/logout_container.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool darkmode = true;
  void toggleDarkMode() {
    setState(() {
      darkmode = !darkmode;
    });
  }

  void logout(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.login_screen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
          ],
        ),
      ),
    );
  }
}
