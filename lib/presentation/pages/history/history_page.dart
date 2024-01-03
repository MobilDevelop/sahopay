import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/history/history_cubit.dart';
import 'package:sahopay/application/history/history_state.dart';
import 'package:sahopay/infrastructure/models/history/get_transactions.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/pages/history/components/exchange_dialog.dart';
import 'components/bottomsheet_widget.dart';
import 'components/bottomsheet_widget1.dart';
import 'components/dialog_widget.dart';
import 'components/exchange_widget.dart';
import 'components/history_item_widget.dart';
import 'components/referal_widget.dart';

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
          centerTitle: true,
          actions: [
            Visibility(
              visible: cubit.filterType==0,
              child: IconButton(onPressed: (){
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context, builder: (context) => BottomsheetWidget(
                  onPress:(int type)=>cubit.chooseType(type), 
                  type: cubit.changetype));
              }, icon: SvgPicture.asset(AppIcons.filter,color: AppTheme.colors.white)),
            )
          ],
        ),
        body:  Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 45.h,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: ScreenSize.h4),
                   padding: EdgeInsets.symmetric(horizontal: ScreenSize.w12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:  Row(
            children: [
              BottomsheetWidget1(icon: AppIcons.bag, 
              selected: cubit.filterType==0, title: tr('history.transactions'), press:()=>cubit.succesFilter(0)),
              Gap(ScreenSize.w8),
              BottomsheetWidget1(icon: AppIcons.exchange2, 
              selected: cubit.filterType==1, title: tr('history.exchanges'), press: ()=>cubit.succesFilter(1)),
              Gap(ScreenSize.w8),
              BottomsheetWidget1(icon: AppIcons.referal, 
              selected: cubit.filterType==2, title: tr('history.referals'), press: ()=>cubit.succesFilter(2)),
              
            ],
          ),
                  ),
                ),
                Expanded(
              child: RefreshIndicator(
                onRefresh: cubit.listRefresh,
                child: NotificationListener<ScrollNotification>(
                onNotification: (notification){
                if(notification.metrics.pixels==notification.metrics.maxScrollExtent){
                 if(!cubit.loading){
                   cubit.init();
                  }
                   return true;
                 }
                 return false;
                  },
                child: cubit.screenType==1?ListView.builder(
                  itemCount: cubit.transactionItems.length+1,
                  itemBuilder:(context, index){
                    if(index<cubit.transactionItems.length){
                      return HistoryItemWidget(
                    press: (HistoryTransaction item) { 
                   AwesomeDialog(
                    context: context,
                    dialogType: cubit.transactionItems[index].trasactionStatus=="WAITING"? 
                    DialogType.error:DialogType.success,
                    animType: AnimType.bottomSlide,
                    
                    body: DialogWidget(item: item),
                    btnOkText: tr("history.ok"),
                    btnOkColor: AppTheme.colors.primary,
                    btnOkOnPress:(){}, 
                    ).show();
                   }, item: cubit.transactionItems[index]);
                    }else{
                      return Gap(50.h);
                    }
                  }
                   ):cubit.screenType==2?
                   
                   ListView.builder(
                    itemCount: cubit.exchangeItems.length+1,
                    itemBuilder: (context, index){
                      if(index<cubit.exchangeItems.length){
                        return ExchangeWidget(item: cubit.exchangeItems[index], 
                    press: () { 
                        AwesomeDialog(
                    context: context,
                    dialogType: cubit.exchangeItems[index].trasactionStatus==tr("history.waiting")? DialogType.error:DialogType.success,
                    animType: AnimType.bottomSlide,
                    body: ExchangeDialogWidget(item: cubit.exchangeItems[index]),
                    btnOkText: tr("history.ok"),
                    btnOkColor: AppTheme.colors.primary,
                    btnOkOnPress:(){},
                    ).show();
                     });
                      }else{
                        return Gap(50.h);
                      }
                    }):
                  
                   ListView.builder(
                    itemCount: cubit.referalsItems.length+1,
                    itemBuilder: (context, index){
                      if(index<cubit.referalsItems.length){
                        return ReferalsWidget(item: cubit.referalsItems[index]);
                      }else{
                        return Gap(50.h);
                      }
                    })
                          ),
              ),),
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





