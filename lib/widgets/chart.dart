import 'package:expenseapp/models/item.dart';
import 'package:expenseapp/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenseapp/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart({
    Key? key,
    required this.recentTransaction,
  }) : super(key: key);

//  ________________________

// getter is use to get or read data of the class

// to get the days of the week
// firt we create getters method nga ang type is List<>

// we used list.generate to create 7 data , nga return sang method nga gin create ta. so we have now 7 list;

// using DateTime.now().subtract(Duration(days: index));  kwaon nya ang date  subong asta sa nag ligad nga 6 days

// to calcute the sum of the days of the week amount
// we used for loop;

// then rertun list object that contain days and amount;

//  ________________________

  List<Item> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDays = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.00;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDays.day &&
            recentTransaction[i].date.month == weekDays.month &&
            recentTransaction[i].date.year == weekDays.year) {
          totalSum += recentTransaction[i].amount;
        }
      }

      return Item(day: DateFormat('EEE').format(weekDays), amount: totalSum);
    }).reversed.toList();
  }

  double get totalSpending {
    return groupTransactionValues.fold(
        0, (sum, element) => sum + element.amount);
  }

  @override
  Widget build(BuildContext context) {
     
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...groupTransactionValues.asMap().entries.map((data) {
              return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      dayslabel: data.value.day,
                      spendingamount: data.value.amount,
                      spendinpcoftotal: totalSpending == 0.0
                          ? 0.0
                          : data.value.amount / totalSpending));
            }).toList()
          ],
        ),
      ),
    );
  }
}
