import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/infrastructure/models/deposit/wallet_items.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class DepositItemWidget extends StatelessWidget {
  const DepositItemWidget({
    super.key, required this.items, required this.selectedItem, required this.press, required this.title, required this.hint,
  });
  final List<WalletItem> items;
  final WalletItem? selectedItem;
  final Function press;
  final String title;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTheme.data.textTheme.bodyMedium),
         Gap(ScreenSize.h4),
        DropdownSearch<WalletItem>(
         mode: Mode.MENU,
        items: items,
        dropdownSearchDecoration: InputDecoration(
        contentPadding:  EdgeInsets.only(left:ScreenSize.w14),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.r),
        borderSide: BorderSide(
        color: AppTheme.colors.primary)),
        focusedBorder: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.r),
        borderSide: BorderSide(
        color: AppTheme.colors.primary))),
        selectedItem: selectedItem,
        itemAsString: (WalletItem? item) {
        return item!.title.toString();},
        onChanged: (item)=>press(item)),
      ],
    );
  }
}