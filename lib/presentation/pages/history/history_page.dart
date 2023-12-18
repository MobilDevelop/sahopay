import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/application/history/history_cubit.dart';
import 'package:sahopay/application/history/history_state.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'components/bottomsheet_widget.dart';
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
                context: context, builder: (context) => BottomsheetWidget(onPress:(Map<String,dynamic> item)=>cubit.succesFilter(item)));
            }, icon: SvgPicture.asset(AppIcons.filter,color: AppTheme.colors.white))
          ],
        ),
        body:  ListView.builder(
          itemCount: cubit.items.length,
          itemBuilder:(context, index) => HistoryItemWidget(press: () {  }, item: cubit.items[index])),
       ));
     },),
     ),
    );
  }
}



