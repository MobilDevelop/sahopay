import 'package:flutter/material.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class CaptchaWidget extends StatelessWidget {
  const CaptchaWidget({
    super.key, required this.image, required this.press, required this.controller,
  });
    final String image;
    final VoidCallback press;
    final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: Text("Are you robot?",style: AppTheme.data.textTheme.titleMedium),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(image),
              Gap(ScreenSize.h20),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: ScreenSize.w10),
                  hintText: "Captcha"
                ),
              )
            ],
          ),
          actions: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenSize.w12,vertical: ScreenSize.h10),
              child: MainButton(onPressed:press, text: "Continue",wrap: true),
            )
          ],
        );
  }
}