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
  static String historyTransactions = '${addition}getAllHistory';
  static String historyExchages = '${addition}getAllHistory-exchange';
  static String historyReferals = '${addition}get-all-referrals';
  static String transferPayment = '${addition}getAll-payment-systems-for-transfer';
  static String transferWallet = '${addition}get-all-wallet/andBalance';
  static String withdrawWallet = '${addition}get-payout-wallet';
  static String withdrawPayment = '${addition}get-AllPayoutPaymentSystem';
  static String exchangeWallet = '${addition}get-all-wallet-and-balance-exchange';
  static String exchangeRates = '${addition}get-all-exchange-rates';
  static String profile = '${addition}account';
  static String profileUpdate = '${addition}update-profile';
  static String passwordUpdate = '${addition}account/change-password';
  static String depositSend = '${addition}create-crytpomus-transaction';
  static String transferPost = '${addition}sahopay-wallet2wallet';
  static String transferCalc = '${addition}trans-calc-withdraw';
  static String exchangeCalc = '${addition}calc-exchange-amount';
  static String exchangePost = '${addition}sahopay-exchange';
  static String withdrawPost = '${addition}create-payout-transaction';
  static String withdrawCalc = '${addition}calcAmount-withdraw';

  static String condition = '/terms-condition';







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
      Colors.blueGrey.shade300,
      Colors.blueGrey.shade600,
      Colors.blueGrey.shade900,
    ],
    [
      Colors.cyan.shade300,
      Colors.cyan.shade600,
      Colors.cyan.shade900,
    ],
    [
      Colors.indigo.shade300,
      Colors.indigo.shade600,
      Colors.indigo.shade900,
    ],
    [
      Colors.green.shade300,
      Colors.green.shade600,
      Colors.green.shade900,
    ],
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
      Colors.blueGrey.shade300,
      Colors.blueGrey.shade600,
      Colors.blueGrey.shade900,
    ],
  ];
  
}