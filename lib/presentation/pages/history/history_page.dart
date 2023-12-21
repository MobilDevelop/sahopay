import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/history/history_cubit.dart';
import 'package:sahopay/application/history/history_state.dart';
import 'package:sahopay/infrastructure/models/history/history_item.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'components/bottomsheet_widget.dart';
import 'components/bottomsheet_widget1.dart';
import 'components/dialog_widget.dart';
import 'components/history_item_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override 
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HistoryCubit(),
     child:  BlocListener<HistoryCubit,HistoryState>(listener: (_, state) {
       
     },
     child: Builder(builder: (context) {
       final cubit = context.read<HistoryCubit>();
      return BlocBuilder<HistoryCubit,HistoryState>(builder: (_, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          elevation: 0,
          title: Text(tr('history.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
          actions: [
            IconButton(onPressed: (){
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context, builder: (context) => BottomsheetWidget(onPress:(int type)=>cubit.succesFilter(type), type: cubit.filterType));
            }, icon: SvgPicture.asset(AppIcons.filter,color: AppTheme.colors.white))
          ],
        ),
        body:  Stack(
          children: [
            Column(
              children: [
                Visibility(
                  visible: cubit.filterType==0,
                  child: Container(
                    height: 45.h,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: ScreenSize.h4),
                     padding: EdgeInsets.symmetric(horizontal: ScreenSize.w12),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:  Row(
            children: [
              BottomsheetWidget1(icon: AppIcons.bag, selected: cubit.changetype==0, title: tr('history.all'), press:()=>cubit.chooseType(0)),
              Gap(ScreenSize.w8),
              BottomsheetWidget1(icon: AppIcons.dollar, selected: cubit.changetype==1, title: tr('history.dollor'), press: ()=>cubit.chooseType(1)),
              Gap(ScreenSize.w8),
              BottomsheetWidget1(icon: AppIcons.euro, selected: cubit.changetype==2, title: tr('history.euro'), press: ()=>cubit.chooseType(2)),
              Gap(ScreenSize.w8),
              BottomsheetWidget1(icon: AppIcons.ruble, selected: cubit.changetype==3, title: tr('history.ruble'), press: ()=>cubit.chooseType(3)),
               Gap(ScreenSize.w8),
              BottomsheetWidget1(icon: AppIcons.dollar, selected: cubit.changetype==4, title: tr('history.dollor'), press: ()=>cubit.chooseType(4)),
              Gap(ScreenSize.w8),
              BottomsheetWidget1(icon: AppIcons.euro, selected: cubit.changetype==5, title: tr('history.euro'), press: ()=>cubit.chooseType(5)),
              Gap(ScreenSize.w8),
              BottomsheetWidget1(icon: AppIcons.ruble, selected: cubit.changetype==6, title: tr('history.ruble'), press: ()=>cubit.chooseType(6)),
              
            ],
          ),
                    ),
                  ),
                ),
                Expanded(
              child: NotificationListener<ScrollNotification>(
              onNotification: (notification){
              if(notification.metrics.pixels==notification.metrics.maxScrollExtent){
               if(!cubit.loading){
                 cubit.init("");
                }
                 return true;
               }
               return false;
                },
              child: ListView.builder(
                itemCount: cubit.items.length,
                itemBuilder:(context, index) => HistoryItemWidget(
                  press: (HistoryItem item) { 
                 AwesomeDialog(
                  context: context,
                  dialogType: cubit.items[index].trasactionStatus=="WAITING"? DialogType.error:DialogType.success,
                  animType: AnimType.bottomSlide,
                  
                  body: DialogWidget(item: item),
                  btnOkText: "OK",
                  btnOkColor: AppTheme.colors.primary,
                  btnOkOnPress:(){},
                  ).show();
                 }, item: cubit.items[index])),
            ),)
              ],
            ),
            Visibility(
              visible: cubit.loading,
              child: const Loading()
               )],
              ),
            ),
          );
        }
       ),
      ),
    );
  }
}

