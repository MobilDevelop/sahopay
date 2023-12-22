import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class ExchangeItemWidget extends StatelessWidget {
  const ExchangeItemWidget({
    super.key, required this.items, required this.selectedItem, required this.press, required this.title, required this.hint, required this.borderColor, required this.errorText,
  });
  final List<WalletObject> items;
  final WalletObject? selectedItem;
  final Function press;
  final String title;
  final String hint;
  final bool borderColor;
  final String errorText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTheme.data.textTheme.bodyMedium),
         Gap(ScreenSize.h4),
        DropdownSearch<WalletObject>(
        mode: Mode.MENU,  
        items: items,
        dropdownSearchDecoration: InputDecoration(
        contentPadding:  EdgeInsets.symmetric(vertical: ScreenSize.h6, horizontal:ScreenSize.w10),
        hintText: hint,
        prefixIcon: selectedItem==null?Container(): Container(
          height: 20.h,
          width: 20.h,
          margin: EdgeInsets.only(left: 8.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.colors.primary
          ),
        child: Text(selectedItem!.currencyName.substring(0,1),style: AppTheme.data.textTheme.headlineMedium!.copyWith(color: AppTheme.colors.white))), 
        enabledBorder: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.r),
        borderSide: BorderSide(
        color: borderColor? AppTheme.colors.red:AppTheme.colors.primary)),
        focusedBorder: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.r),
        borderSide: BorderSide(
        color: AppTheme.colors.primary))),
        selectedItem: selectedItem,
        itemAsString: (WalletObject? item) {
        return "   ${item!.account} \n   ${item.balance} ${item.currencyName}";},
        onChanged: (item)=>press(item)),
        Visibility(
          visible: borderColor,
          child: Column(
            children: [
              Gap(ScreenSize.h4),
          Text(errorText,style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.red)),
            ],
          ),
        )
         
      ],
    );
  }
}