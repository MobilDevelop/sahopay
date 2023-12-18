
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:sahopay/presentation/assets/res/app_icons.dart';

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