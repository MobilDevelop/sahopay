import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/transfer/payment.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class TransferPaymentWidget extends StatelessWidget {
  const TransferPaymentWidget({
    super.key, required this.items, required this.selectedItem, required this.press, required this.title, required this.hint,
  });
  final List<TransferPayment> items;
  final TransferPayment? selectedItem;
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
        DropdownSearch<TransferPayment>(
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
          child: Text(selectedItem!.systemName.substring(0,1),style: AppTheme.data.textTheme.headlineMedium!.copyWith(color: AppTheme.colors.white))),
        enabledBorder: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.r),
        borderSide: BorderSide(
        color: AppTheme.colors.primary)),
        focusedBorder: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.r),
        borderSide: BorderSide(
        color: AppTheme.colors.primary))),
        selectedItem: selectedItem,
        itemAsString: (TransferPayment? item) {
        return "   ${item!.systemName} \n   ${Helper.toProcessCost(item.commission.toString())} %";},
        onChanged: (item)=>press(item)),
      ],
    );
  }
}