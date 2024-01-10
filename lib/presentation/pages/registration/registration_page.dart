import 'package:flutter/material.dart';
import 'package:sahopay/application/registration/registration_cubit.dart';
import 'package:sahopay/application/registration/registration_state.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/presentation/pages/login/components/circle_user_widget.dart';
import 'package:sahopay/presentation/pages/login/components/registration_widget.dart';
import 'package:sahopay/presentation/pages/login/components/text_widget.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:sahopay/presentation/routes/index_routes.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => RegistrationCubit(),
     child:  BlocListener<RegistrationCubit,RegistrationState>(listener: (_, state) {    
      if(state is RegistrationNextLogin){
        context.go(Routes.login.path);
      } else if(state is RegistrationError){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppTheme.colors.primary,
              content: Text(
                state.message,
                textAlign: TextAlign.center,
                style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.white)
              ),
            ),
          );
      }else if(state is RegistrationSucces){
        context.go(Routes.forgotPass.path,extra: state.param);
      }
     },
     child: Builder(builder: (context) {
       final cubit = context.read<RegistrationCubit>();
       return BlocBuilder<RegistrationCubit,RegistrationState>(builder: (_, state) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(ScreenSize.h32),
              SizedBox(
                height: 120.h,
                child: Gif(image: const AssetImage(AppIcons.logo),autostart: Autostart.loop,fit: BoxFit.fitWidth)), 
                Container(
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
                  child: Column(
                  children: [
                   const RegistrationWidget(),
                  Gap(ScreenSize.h10),
                  const CircleUserWidget(),
                  TextWidget(controller: cubit.loginController,
                  title:  tr('login_page.login'), 
                  hintText: tr('login_page.error1'),
                  border: cubit.borderEmail, 
                  visible: false, 
                  overflow: false, 
                  showText: (){}),
                  Column(
                  children: [TextWidget(
                  controller: cubit.passwordController,
                  title:  tr('login_page.pass'), 
                  hintText: tr('login_page.error2'),
                  border: cubit.borderPassword, 
                  visible: true, 
                  overflow: cubit.passwordVisible, 
                  showText:()=>cubit.visiblePassword(1)
                  ),
                  ],
                  ),
                  Column(
                    children: [
                  TextWidget(controller: cubit.confirmPasswordController,
                  title:  tr('login_page.confirm'), 
                  hintText: tr('login_page.error3'),
                  border: cubit.borderConfirm, 
                  visible: true, 
                  overflow: cubit.confirmpasswordVisible, 
                  showText:()=>cubit.visiblePassword(2)
                  ),
                  TextWidget(controller: cubit.referalController,
                  title:  tr('login_page.referal'), 
                  hintText: "",
                  border:  false, 
                  visible: false, 
                  overflow:false, 
                  showText:(){}),
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: cubit.borderCheck?AppTheme.colors.red:AppTheme.colors.grey
                          ),
                          child: Checkbox(value: cubit.checked, 
                          onChanged: cubit.showChecked,
                          activeColor: AppTheme.colors.primary), 
                        ),
                        Text(tr('login_page.agree'),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                        Gap(ScreenSize.w10),
                        Bounce(
                          duration: Duration(milliseconds: AppContatants.duration),
                          onPressed:cubit.launchURL,
                          child: Text (tr('login_page.terms'),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.primary))),
                      ],
                    ),
                    Visibility(
                      visible: cubit.borderCheck,
                      child: Column(
                        children: [
                          Text(
                             tr('login_page.error4'),
                              style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.red),
                              ),
                          Gap(ScreenSize.h16)
                        ],
                      ),
                    ),
                  ],
                  )
                    ],
                  ),
                    ]),
                 ),
                 Container(
                  padding: EdgeInsets.only(left: ScreenSize.w12,right: ScreenSize.w12,bottom: ScreenSize.h32,top: 50.h),
                  child: Column(
                    children: [
                      Gap(ScreenSize.h16),
                      MainButton(text: tr('login_page.enter'),
                      wrap: true, 
                      showLoading: cubit.loading,
                      onPressed:()=>cubit.checkRegistration(context)),
                       Gap(ScreenSize.h20),
                       Padding(
                         padding:  EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(tr('login_page.comment1'),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                            Bounce(
                              duration: const Duration(milliseconds: 300),
                              onPressed:cubit.checkView,
                              child: Text(tr('login_page.signin'),style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.primary))),
                          ],
                         ),
                       ),
                    ],
                  ),
                 )
            ]),
        ),

            )
          );
        }),
      ),
    );
  }
}