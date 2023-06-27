// import 'package:setsubmobile/export.dart';
// import 'package:flutter/material.dart';
//
// class InitializationCmd extends BaseCommand {
//   InitializationCmd(super.c);
//   AuthProvider get auth => getProvider();
//   TransactionsProvider get _transaction => getProvider();
//
//   void initUser() async {
//     BuildContext context = rootNav!.context;
//     LoginCmd(context).getUser();
//     // DataCmd(context).getDiscounts();
//     AirtimeCmd(context).getDiscounts();
//     ElectricityComand(context).getDiscounts();
//     ExamComand(context).getDiscounts();
//     CableCmd(context).getDiscount();
//
//     //
//     TransactionsCmd(context).getTransactions();
//     await NotificationCmd(context).getNotification();
//     await AlertCmd(context).getAlert();
//   }
//
//   Future<void> refreshUser() async {
//     BuildContext context = rootNav!.context;
//     LoginCmd(context).getUser();
//     TransactionsCmd(context).getTransactions();
//     await NotificationCmd(context).getNotification();
//     AirtimeCmd(context).getDiscounts();
//     ElectricityComand(context).getDiscounts();
//     ExamComand(context).getDiscounts();
//     CableCmd(context).getDiscount();
//   }
// }
