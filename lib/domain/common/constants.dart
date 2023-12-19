import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppContatants{

  static String addition = dotenv.env['addition']!;//test

  static String imageUrl = dotenv.env['imageUrl']!;//test
   
  static String registration = '${addition}register';
  static String captcha = '${addition}get-temp-captcha';
  static String succesCode = '${addition}mobile-activate';
  static String login = '${addition}auth-mail';
  static String forgotPassword = '${addition}account/reset-password/init';
  static String newPassword = '${addition}account/reset-password/finish';
  static String dashboard = '${addition}get-all-wallet/andBalance';
  static String depositAllWallet = '${addition}get-all-wallet-andBalance-deposit';
  static String depositAllPayment = '${addition}getAll-payment-systems-for-deposit';
  static String history = '${addition}getAllHistory';
  static String historyReferals = '${addition}get-all-referrals';
  static String transferPayment = '${addition}getAll-payment-systems-for-transfer';
  static String transferWallet = '${addition}get-all-wallet/andBalance';
  static String withdrawWallet = '${addition}get-payout-wallet';
  static String withdrawPayment = '${addition}get-AllPayoutPaymentSystem';
  static String exchangeWallet = '${addition}get-all-wallet-and-balance-exchange';
  static String exchangeRates = '${addition}get-all-exchange-rates';




  static String appVersion = '1.2.2';

  static int duration = 200;
  
  static List<List<Color>> backgroundColor = [
    [
      Colors.blue.shade300,
      Colors.blue.shade600,
      Colors.blue.shade900,
    ],
    [
      Colors.teal.shade300,
      Colors.teal.shade600,
      Colors.teal.shade900,
    ],
    [
      Colors.green.shade300,
      Colors.green.shade600,
      Colors.green.shade900,
    ],
    
    [
      Colors.green.shade300,
      Colors.green.shade600,
      Colors.green.shade900,
    ],
    [
      Colors.green.shade300,
      Colors.green.shade600,
      Colors.green.shade900,
    ],
    [
      Colors.green.shade300,
      Colors.green.shade600,
      Colors.green.shade900,
    ],
    [
      Colors.green.shade300,
      Colors.green.shade600,
      Colors.green.shade900,
    ]
  ];
  
}