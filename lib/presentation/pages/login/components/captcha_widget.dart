import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahopay/application/login/captcha/captcha_cubit.dart';
import 'package:sahopay/application/login/captcha/captcha_state.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class CaptchaWidget extends StatelessWidget {
  const CaptchaWidget({
    super.key,  required this.press, required this.controller,
  });
    final Function press;
    final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CaptchaCubit(),
    child: Builder(builder: (context){
      final cubit = context.read<CaptchaCubit>();
        return BlocBuilder<CaptchaCubit,CaptchaState>(builder: (context, state) => AlertDialog(
          title: Text(tr('login_page.robot'),style: AppTheme.data.textTheme.titleMedium),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              cubit.captcha==null?Container():Image.network(cubit.captcha!.photoUrl),
              Gap(ScreenSize.h20),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: ScreenSize.w10),
                  hintText: tr('login_page.captcha')
                ),
              )
            ],
          ),
          actions: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenSize.w12,vertical: ScreenSize.h10),
              child: Row(
                children: [
                  Expanded(child: MainButton(onPressed:(){
                    if(cubit.captcha!=null){
                      press(cubit.captcha);
                    }
                  }, text: tr('login_page.continue'))),
                  Gap(ScreenSize.w6),
                  Bounce(
                    duration: Duration(milliseconds: AppContatants.duration),
                    onPressed:()=>cubit.init(),
                    child: Container(
                    height: 40.h,
                    width: 40.h,
                    padding: EdgeInsets.all(ScreenSize.h6),
                    decoration: BoxDecoration(
                      color: AppTheme.colors.white,
                      border: Border.all(
                        color: AppTheme.colors.primary,
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                       boxShadow: [
                              BoxShadow(
                                color: AppTheme.colors.grey,
                                blurRadius: 10,
                                spreadRadius: 4,
                                offset: Offset(5.w, 6.h)
                              )
                            ],
                    ),
                    child: SvgPicture.asset(AppIcons.refresh),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
        })
    );
  }
}