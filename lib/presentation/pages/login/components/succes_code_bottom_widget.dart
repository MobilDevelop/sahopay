import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/button/main_button.dart';
import 'package:sahopay/presentation/components/button/text_button_x.dart';

class SuccesCodeBottomWidget extends StatelessWidget {
  const SuccesCodeBottomWidget({
    super.key, required this.succesPress, required this.resendPress, required this.visible,
  });
  final VoidCallback succesPress;
  final VoidCallback resendPress;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.w14),
      child: Column(
        children: [
          MainButton(text: visible?"Continue":"Verify", onPressed:succesPress),
          Gap(ScreenSize.h20),
         Visibility(
          visible: !visible,
           child: Column(
            children: [
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
                  child: Text("Don't have a code?",style: AppTheme.data.textTheme.titleSmall),
                ),
                Expanded(
                  child: Divider(
                    height: 1,
                    color: AppTheme.colors.grey,
                  ),
                ),
              ],
            ),
            Gap(ScreenSize.h14),
            TextButtonX(onPressed:resendPress, text: "Resend code",textColor: AppTheme.colors.primary),
            Gap(ScreenSize.h24)
            ],
           ),
         )
        ],
      ),
    );
  }
}
