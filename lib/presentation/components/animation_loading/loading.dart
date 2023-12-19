import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});
  @override
  Widget build(BuildContext context) {
    Widget current = Container();
      int index = Helper.randomNumber(); 
     switch (index) {
       case 0: current= Center(child: LoadingAnimationWidget.dotsTriangle(color: AppTheme.colors.secondary, size: 120));break;
       case 1:current = Center(child: LoadingAnimationWidget.waveDots(color: AppTheme.colors.secondary, size: 120));break;
       case 2:current = Center(child: LoadingAnimationWidget.inkDrop(color: AppTheme.colors.secondary, size: 120));break;
       case 3:current = Center(child: LoadingAnimationWidget.threeRotatingDots(color: AppTheme.colors.secondary, size: 120));break;
       case 4:current = Center(child: LoadingAnimationWidget.staggeredDotsWave(color: AppTheme.colors.secondary, size: 120));break;
       case 5:current = Center(child: LoadingAnimationWidget.fourRotatingDots(color: AppTheme.colors.secondary, size: 120));break;
       case 6:current = Center(child: LoadingAnimationWidget.fallingDot(color: AppTheme.colors.secondary, size: 120));break;
       case 7:current = Center(child: LoadingAnimationWidget.prograssiveDots(color: AppTheme.colors.secondary, size: 120));break;
       case 8:current = Center(child: LoadingAnimationWidget.threeArchedCircle(color: AppTheme.colors.secondary, size: 120));break;
       case 9:current = Center(child: LoadingAnimationWidget.bouncingBall(color: AppTheme.colors.secondary, size: 120));break;
       case 10:current = Center(child: LoadingAnimationWidget.hexagonDots(color: AppTheme.colors.secondary, size: 120));break;
       case 11:current = Center(child: LoadingAnimationWidget.beat(color: AppTheme.colors.secondary, size: 120));break;
       case 12:current = Center(child: LoadingAnimationWidget.twoRotatingArc(color: AppTheme.colors.secondary, size: 120));break;
       case 13:current = Center(child: LoadingAnimationWidget.horizontalRotatingDots(color: AppTheme.colors.secondary, size: 120));break;
       case 14:current = Center(child: LoadingAnimationWidget.newtonCradle(color: AppTheme.colors.secondary, size: 120));break;
       case 15:current = Center(child: LoadingAnimationWidget.stretchedDots(color: AppTheme.colors.secondary, size: 120));break;
       case 16:current = Center(child: LoadingAnimationWidget.halfTriangleDot(color: AppTheme.colors.secondary, size: 120));break;
     }
     return Container(
      //padding: EdgeInsets.all(ScreenSize.h32),
      child: Container(
        color: AppTheme.colors.grey.withOpacity(.1),
        child: ClipRect(
          child: BackdropFilter(
               filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
               child: current
               ),
        ),
      ),
     );
  }
}