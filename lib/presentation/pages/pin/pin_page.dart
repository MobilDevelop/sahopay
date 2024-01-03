// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahopay/application/pin/pin_cubit.dart';
import 'package:sahopay/application/pin/pin_state.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:sahopay/presentation/pages/pin/components/numbers_widget.dart';
import 'package:sahopay/presentation/pages/pin/components/pin_text_widget.dart';
import 'package:sahopay/presentation/routes/index_routes.dart';


class PinPage extends StatelessWidget {
  const PinPage({super.key, required this.type});
  final int type;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context) => PinCubit(type),
    child: BlocListener<PinCubit,PinState>(listener: (_, state) {
      if(state is PinNextHome){
        context.go(Routes.home.path);
      }else if(state is PinClose){
        Navigator.pop(context);
      }
    },
    child: Builder(builder: (context) {
      final cubit = context.read<PinCubit>();
      return BlocBuilder<PinCubit,PinState>(builder: (_, state) =>  Scaffold(
        appBar: type==2? AppBar(
          backgroundColor: AppTheme.colors.white,
          leading: IconButton(onPressed: (){
            Navigator.pop(context); 
          }, icon: SvgPicture.asset(AppIcons.back,color: AppTheme.colors.primary)),
          elevation: 0,
          title: Text(cubit.title,style: AppTheme.data.textTheme.displaySmall!.copyWith(color: AppTheme.colors.primary)),
          centerTitle: true,
        ):AppBar(
           backgroundColor: AppTheme.colors.white,
          elevation: 0,
          title: Text(cubit.title,style: AppTheme.data.textTheme.displaySmall!.copyWith(color: AppTheme.colors.primary)),
          centerTitle: true,
        ),


        body: SafeArea(
        child: Stack(
          children: [
            Column(
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
                        NumbersWidget(title: '-', icon: cubit.clearCheck?AppIcons.back:type==1? AppIcons.fingerprint:AppIcons.back, onTap: cubit.writeText),
                      ],
                    ),
                    Gap(ScreenSize.h32)
                      ]),  
                    ]),
              Visibility(
                visible: cubit.loading,
                child: const Loading())
          ],
        ),
              ),
            ),
          );
        }),
      ),
    );
  }
}