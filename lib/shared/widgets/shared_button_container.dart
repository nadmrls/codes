import 'package:flutter/cupertino.dart';
import 'package:personal_company/app/utils/app_color.dart';

class SharedButtonContainer extends StatelessWidget {
  final String title;
  final Icon icon;
  final VoidCallback onPressed;

  const SharedButtonContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed, // Ensure the function is executed on tap
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.color_white,
            borderRadius:
                BorderRadius.circular(8), // Optional for a better look
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 10), // Space between text and icon
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
