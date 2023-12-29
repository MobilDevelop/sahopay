import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/history/history_bottomsheet/history_bottomsheet_cubit.dart';
import 'package:sahopay/application/history/history_bottomsheet/history_bottomsheet_state.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'bottomsheet_widget2.dart';

class BottomsheetWidget extends StatelessWidget {
  const BottomsheetWidget({
    super.key, required this.onPress, required this.type,
  });
  final Function onPress;
  final int type;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>HistoryBottomsheetCubit(type),
    child: BlocListener<HistoryBottomsheetCubit,HistoryBottomsheetState>(listener: (context, state) {
      
    },
    child: Builder(builder: (context) {
      final cubit = context.read<HistoryBottomsheetCubit>();
      return BlocBuilder<HistoryBottomsheetCubit,HistoryBottomsheetState>(builder: (context, state) => Container(
     height: 250.h,
              width: double.maxFinite,
              padding: EdgeInsets.only(left: ScreenSize.w10,right: ScreenSize.w10),
              decoration: BoxDecoration(
              color: AppTheme.colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r))
    ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
        Column(
          children: [
            Gap(ScreenSize.h10),
             Container(
            height: ScreenSize.h4,
            width: 130.w,
            decoration: BoxDecoration(
              color: AppTheme.colors.black,
              borderRadius: BorderRadius.circular(4.r)
            ),
          ),
          Gap(ScreenSize.h18),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h14),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.colors.primary
              ),
              borderRadius: BorderRadius.circular(12.r)
            ),
            child: Column(
              children: [
              BottomsheetWidget2(icon: AppIcons.bag, selected: cubit.changed==0, title:tr('history.transactions'), press: (){
                cubit.chooseChangeg(0);
                onPress(cubit.changed);
                Navigator.pop(context);
              }),
              Gap(ScreenSize.h10),
               BottomsheetWidget2(icon: AppIcons.exchange2, selected: cubit.changed==1, title:tr('history.exchanges'), press: (){
                cubit.chooseChangeg(1);
                onPress(cubit.changed);
                Navigator.pop(context);
               }),
              Gap(ScreenSize.h10),
               BottomsheetWidget2(icon: AppIcons.referal, selected: cubit.changed==2, title:tr('history.referals'), press: (){
                cubit.chooseChangeg(2);
                onPress(cubit.changed);
                Navigator.pop(context);
               }),
              ],
            ),
          ),
          Gap(ScreenSize.h32),
         
          ],
        ),
          // Row(
          //   children: [
          //     Expanded(child: BorderButton(onPressed: (){Navigator.pop(context);}, text: tr('history.cancel'),borderColor: AppTheme.colors.red)),
          //     Gap(ScreenSize.w10),
          //     Expanded(child: BorderButton(onPressed: (){
          //       onPress(cubit.changed);
          //       Navigator.pop(context);
          //     }, text: tr('history.ok'),borderColor: AppTheme.colors.green)),
          //   ],
          // )
    ],
      ),
     ));
    },),
    ),
    );
  }
}