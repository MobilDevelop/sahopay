import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/dashboard/dashboard_cubit.dart';
import 'package:sahopay/application/dashboard/dashboard_state.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/routes/index_routes.dart';
import 'components/card_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.press, required this.nextDeposit});
   final VoidCallback press;
   final Function nextDeposit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DashboardCubit(),
     child:  BlocListener<DashboardCubit,DashboardState>(listener: (_, state) {
       if(state is DashboardNextTransfer){
        context.push(Routes.transfer.path,extra: state.model);
       }else if(state is DashboardNextWithDraw){
        context.push(Routes.withdraw.path,extra: state.model);
       }else if(state is DashboardNextDeposit){
        nextDeposit(state.model);
       }
     },
     child: Builder(builder: (context) {
       final cubit = context.read<DashboardCubit>();
       return BlocBuilder<DashboardCubit,DashboardState>(builder: (_, state) => Scaffold(
       
        appBar: AppBar(
          backgroundColor: AppTheme.colors.background,
          elevation: 0,
          leading: Builder(
            builder: (context) {
              return IconButton(onPressed:press, icon: SvgPicture.asset(AppIcons.menu,height: ScreenSize.h32,color: AppTheme.colors.primary));
            }
          ),
          title: Text(tr('dashboard.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
          centerTitle: true,
          actions: [
            IconButton(onPressed:cubit.launchURL, icon: SvgPicture.asset(AppIcons.support)),
            Gap(ScreenSize.w6)
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: cubit.listRefresh,
                    child: ListView.builder(
                    itemCount: cubit.items.length+1,
                    itemBuilder: (context, index){ 
                     if(index<cubit.items.length){
                      return CardWidget(item: cubit.items[index], 
                    index: index, 
                    backgroundColor:AppContatants.backgroundColor[index], 
                    onPress:(int current)=>cubit.nextScreen(current,cubit.items[index]), 
                    copyText: (String text)=>cubit.copyText(text));
                     }else{
                      return Gap(70.h);
                     }
                     })
                  ),
                ),
              ],
            ),
            Visibility(
              visible:  cubit.loading,
              child: const Loading())
          ],
        ),
       ));
     },),
     ),
    );
  }
}

