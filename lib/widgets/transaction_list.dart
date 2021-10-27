import 'package:expenseapp/widgets/transaction_list_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenseapp/models/transaction.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactionlist;
  final Function deletetransaction;
  TransactionList({
    Key? key,
    required this.transactionlist,
    required this.deletetransaction,
  }) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    return widget.transactionlist.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'Record is Empty',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/marketing.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: ListView.builder(
                itemCount: widget.transactionlist.length,
                itemBuilder: (context, index) {
                  return TransactionListItem(
                      transactionlist: widget.transactionlist[index],
                      mediaquery: mediaquery,
                      deletetransaction: widget.deletetransaction);
                }),
          );
  }
}
