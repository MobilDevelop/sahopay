import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:gif/gif.dart';
import 'package:sahopay/application/login/login_cubit.dart';
import 'package:sahopay/application/login/login_state.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/button/main_button.dart';

import 'components/text_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubit(),
    child:  BlocListener<LoginCubit,LoginState>(listener: (context, state) {
      
    },
    child: Builder(builder: (context) {
      final cubit = context.read<LoginCubit>();
      return BlocBuilder<LoginCubit,LoginState>(builder: (context, state) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Gap(ScreenSize.h32),
            SizedBox(
              height: 150.h,
              child: Gif(image: const AssetImage(AppIcons.logo),autostart: Autostart.loop,fit: BoxFit.fitWidth,)), 
              Expanded(child: Container(
                margin: EdgeInsets.symmetric(horizontal: ScreenSize.w20),
                padding: EdgeInsets.symmetric(horizontal: ScreenSize.w18,vertical: ScreenSize.h8),
                width: double.maxFinite,
                decoration: BoxDecoration(
              color: AppTheme.colors.white,
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: AppTheme.colors.primary.withOpacity(.3),
                width: 2
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  spreadRadius: 15,
                  color: Colors.grey.shade400,
                  offset: Offset(18.w,18.h)
                )
              ]),
                child: SingleChildScrollView(
                  child: Column(
                children: [
                  cubit.chooseView?Column(
                  children: [
                  Gap(ScreenSize.h8),
                  Text("Hi Welcome",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
                  Gap(ScreenSize.h4),
                  Text("Sign up with Email address",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
                  ],
                  ):Column(
                    children: [
                  Gap(ScreenSize.h14),
                  Text("Hi Welcome Back",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
                  Gap(ScreenSize.h4),
                  Text("Enter your credentials to continue",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
                  Gap(ScreenSize.h4),
                  Text("Sign in with Email address",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
                    ],
                  ),
                  Gap(ScreenSize.h10),
                  Container(
                    padding: EdgeInsets.all(ScreenSize.h12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppTheme.colors.primary,
                        width: 2
                      ),
                      shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset(AppIcons.user,height: 45.h,fit: BoxFit.cover,color:AppTheme.colors.primary,)),
                  TextWidget(controller: cubit.loginController,title:  tr('login_page.login')),
                  TextWidget(controller: cubit.passwordController,title:  tr('login_page.pass')),
                  Visibility(
                    visible: cubit.chooseView,
                    child: Column(
                      children: [
                  TextWidget(controller: cubit.loginController,title:  tr('login_page.confirm')),
                  TextWidget(controller: cubit.passwordController,title:  tr('login_page.referal')),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value){}),
                      Text("Agree with",style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.grey)),
                      Gap(ScreenSize.w10),
                      Text("Terms & Condition",style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.primary)),
                    ],
                  )
                      ],
                    )),
                    ]),
                ),
               )),
               Container(
                padding: EdgeInsets.only(left: ScreenSize.w12,right: ScreenSize.w12,bottom: ScreenSize.h32,top: ScreenSize.h24),
                child: Column(
                  children: [
                    Gap(ScreenSize.h16),
                    MainButton(text: tr('login_page.enter'),
                    wrap: true, 
                    showLoading: cubit.loading,
                    onPressed: cubit.checkInfo),
                     Gap(ScreenSize.h20),
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(cubit.chooseView?tr('login_page.comment1'):tr('login_page.comment2'),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                          Bounce(
                            duration: const Duration(milliseconds: 300),
                            onPressed:cubit.checkView,
                            child: Text(cubit.chooseView?tr('login_page.signin'):tr('login_page.signup'),style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.primary))),
                        ],
                       ),
                     ),
                  ],
                ),
               )
          ]),
      ));
    },),
    ),
    );
  }
}

