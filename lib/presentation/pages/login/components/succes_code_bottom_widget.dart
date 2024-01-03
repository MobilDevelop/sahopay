import 'package:flutter/material.dart';
import 'package:sahopay/presentation/components/button/border_button.dart';
import 'package:sahopay/presentation/components/button/text_button_x.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class SuccesCodeBottomWidget extends StatelessWidget {
  const SuccesCodeBottomWidget({
    super.key, required this.succesPress, required this.resendPress, 
    required this.visible, required this.backPress, 
    required this.resendShow, required this.showResend, required this.controller,
  });
  final VoidCallback succesPress;
  final VoidCallback resendPress;
  final VoidCallback backPress;
  final VoidCallback resendShow;
  final bool visible;
  final bool showResend;
  final CountdownController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.w14),
      child: Column(
        children: [
          MainButton(text: visible?tr('login_page.enter'):tr('login_page.verify'), onPressed:succesPress),
          Gap(ScreenSize.h20),
         Column(
          children: [
             SizedBox(
              height: 40.h,
              child: BorderButton(onPressed:backPress, text:tr('login_page.back'),borderColor: AppTheme.colors.grey)),
             Gap(ScreenSize.h20),
             Row(
            children: [
               Expanded(
                child: Divider(
                  height: 1,
                  color: AppTheme.colors.grey,
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: ScreenSize.w16),
                child: Text( tr('login_page.dontcode'),style: AppTheme.data.textTheme.titleSmall),
              ),
              Expanded(
                child: Divider(
                  height: 1,
                  color: AppTheme.colors.grey,
                ),
              ),
            ],
          ),
          Gap(ScreenSize.h10),
          Countdown(
         seconds: 60,
         controller: controller,
         build: (BuildContext context, double time){
          return Text(time==60?"01:00":time>=10?"00:${time.round()}":"00:0${time.round()}",
          style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.grey));
         },
         interval: const Duration(seconds: 1),
         onFinished: resendShow,
        ),
          Gap(ScreenSize.h4),
          TextButtonX(onPressed:resendPress, text: tr('login_page.resend'),
          textColor: showResend?AppTheme.colors.primary:AppTheme.colors.grey),
          Gap(ScreenSize.h24)
          ],
         )
        ],
      ),
    );
  }
}
