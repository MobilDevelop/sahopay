// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahopay/application/home/home_cubit.dart';
import 'package:sahopay/application/home/home_state.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/pages/pin/components/numbers_widget.dart';
import 'package:sahopay/presentation/pages/pin/components/pin_text_widget.dart';


class PinPage extends StatelessWidget {
  const PinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context) => HomeCubit(),
    child: BlocListener<HomeCubit,HomeState>(listener: (_, state) {
    },
    child: Builder(builder: (context) {
      final cubit = context.read<HomeCubit>();
      return BlocBuilder<HomeCubit,HomeState>(builder: (_, state) =>  Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          leading: IconButton(onPressed: (){
            Navigator.pop(context); 
          }, icon: SvgPicture.asset(AppIcons.back,color: AppTheme.colors.white)),
          elevation: 0,
          title: Text("Pin",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
        ),
        body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 10,
            child: Container(
              margin: EdgeInsets.only(top: 80.h, left: 40.w, right: 40.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    PinTextWidget(),
                    PinTextWidget(),
                    PinTextWidget(),
                    PinTextWidget(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 25.h, horizontal: 50.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NumbersWidget(title: '1', onTap: () {}),
                        NumbersWidget(title: '2', onTap: () {}),
                        NumbersWidget(title: '3', onTap: () {}),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NumbersWidget(title: '4', onTap: () {}),
                        NumbersWidget(title: '5', onTap: () {}),
                        NumbersWidget(title: '6', onTap: () {}),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NumbersWidget(title: '7', onTap: () {}),
                        NumbersWidget(title: '8', onTap: () {}),
                        NumbersWidget(title: '9', onTap: () {}),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Bounce(
                            duration: const Duration(milliseconds: 100),
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5.w, color: AppTheme.colors.white),
                                  color: AppTheme.colors.white,
                                  shape: BoxShape.circle),
                              child: Center(
                                child: SvgPicture.asset(AppIcons.fingerprint, height: 30.h,width: 30.h, color: AppTheme.colors.white),
                              ),
                            ),
                          ),
                          NumbersWidget(title: '0', onTap: () {}),
                          Bounce(
                            duration: const Duration(milliseconds: 100),
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5.w,color: AppTheme.colors.primary),
                                  color: AppTheme.colors.primary.withOpacity(0.05),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: SvgPicture.asset(AppIcons.fingerprint, height: 30.h, width: 30.h),
                              ),
                            ),
                          ),
                        ]),
                      ]),
                    ),
                  ),
                ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}


