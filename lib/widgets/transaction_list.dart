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
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: ListView.builder(
            itemCount: widget.transactionlist.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                          child: Text(
                        widget.transactionlist[index].amount.toString(),
                        style: Theme.of(context).textTheme.headline1,
                      )),
                    ),
                    title: Text(widget.transactionlist[index].title),
                    subtitle: Text(DateFormat.yMMMMEEEEd()
                        .format(widget.transactionlist[index].date)),
                    trailing: IconButton(
                        onPressed: () => widget.deletetransaction(
                            widget.transactionlist[index].id),
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
