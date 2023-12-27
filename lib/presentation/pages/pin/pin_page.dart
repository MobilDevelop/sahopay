// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahopay/application/pin/pin_cubit.dart';
import 'package:sahopay/application/pin/pin_state.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:sahopay/presentation/pages/pin/components/numbers_widget.dart';
import 'package:sahopay/presentation/pages/pin/components/pin_text_widget.dart';
import 'package:sahopay/presentation/routes/index_routes.dart';


class PinPage extends StatelessWidget {
  const PinPage({super.key, required this.type});
  final int type;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context) => PinCubit(),
    child: BlocListener<PinCubit,PinState>(listener: (_, state) {
      if(state is PinNextHome){
        context.go(Routes.home.path);
      }
    },
    child: Builder(builder: (context) {
      final cubit = context.read<PinCubit>();
      return BlocBuilder<PinCubit,PinState>(builder: (_, state) =>  Scaffold(
        appBar: type==1? AppBar(
          backgroundColor: AppTheme.colors.background,
          elevation: 0,
          title: Text("Enter pin code",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
        ): AppBar(
          backgroundColor: AppTheme.colors.primary,
          leading: IconButton(onPressed: (){
            Navigator.pop(context); 
          }, icon: SvgPicture.asset(AppIcons.back,color: AppTheme.colors.white)),
          elevation: 0,
          title: Text("Pin",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
        ),
        body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            margin: EdgeInsets.only(top: 100.h, left: 40.w, right: 40.w),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                PinTextWidget(check: cubit.text.isNotEmpty, errorBorder: cubit.errorBorder),
                PinTextWidget(check: cubit.text.length>1, errorBorder: cubit.errorBorder),
                PinTextWidget(check: cubit.text.length>2, errorBorder: cubit.errorBorder),
                PinTextWidget(check: cubit.text.length>3, errorBorder: cubit.errorBorder),
              ],
            )
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumbersWidget(title: '1', onTap:cubit.writeText),
                    NumbersWidget(title: '2', onTap:cubit.writeText),
                    NumbersWidget(title: '3', onTap:cubit.writeText),
                  ],
                ),
                Gap(ScreenSize.h16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumbersWidget(title: '4', onTap:cubit.writeText),
                    NumbersWidget(title: '5', onTap:cubit.writeText),
                    NumbersWidget(title: '6', onTap:cubit.writeText),
                  ],
                ),
                Gap(ScreenSize.h16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumbersWidget(title: '7', onTap: cubit.writeText),
                    NumbersWidget(title: '8', onTap: cubit.writeText),
                    NumbersWidget(title: '9', onTap: cubit.writeText),
                  ],
                ),
                Gap(ScreenSize.h16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumbersWidget(title: '', onTap: cubit.writeText),
                    NumbersWidget(title: '0', onTap: cubit.writeText),
                    NumbersWidget(title: '-', icon: cubit.clearCheck?AppIcons.back:AppIcons.fingerprint, onTap: cubit.writeText),
                  ],
                ),
                Gap(ScreenSize.h32)
                  ]),  
                ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}