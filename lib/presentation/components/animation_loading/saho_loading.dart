
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:sahopay/presentation/assets/res/app_icons.dart';
<<<<<<< HEAD
=======
import 'package:sahopay/presentation/assets/theme/app_theme.dart';
>>>>>>> 561aeb50106511890c845893305fd196bab1dbb0

class SahoLoading extends StatelessWidget {
  const SahoLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Gif(image: const AssetImage(AppIcons.loading),
    autostart: Autostart.loop,
    //color: AppTheme.colors.green,
    fit: BoxFit.fitWidth);
  }
}