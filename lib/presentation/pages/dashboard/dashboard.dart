import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/dashboard/dashboard_cubit.dart';
import 'package:sahopay/application/dashboard/dashboard_state.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
<<<<<<< HEAD
import 'package:sahopay/presentation/components/animation_loading/saho_loading.dart';
=======
import 'package:sahopay/presentation/assets/res/app_icons.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';
import 'package:sahopay/presentation/components/animation_loading/saho_loading.dart';

>>>>>>> 561aeb50106511890c845893305fd196bab1dbb0
import 'components/card_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.press});
   final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DashboardCubit(),
     child:  BlocListener<DashboardCubit,DashboardState>(listener: (_, state) {
       
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
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Gap(ScreenSize.h14),
                  for(int i=0;i<cubit.items.length;i++)
<<<<<<< HEAD
                   CardWidget(item: cubit.items[i], index: i),
=======
                   CardWidget(item: cubit.items[i]),
>>>>>>> 561aeb50106511890c845893305fd196bab1dbb0
                   Gap(60.h)
                ],
              ),
            ),
            Visibility(
              visible:  cubit.loading,
              child: const SahoLoading())
          ],
        ),
       ));
     },),
     ),
    );
  }
}

