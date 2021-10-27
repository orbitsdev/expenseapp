import 'dart:math';

import 'package:expenseapp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListItem extends StatefulWidget {
  const TransactionListItem({
    Key? key,
    required this.transactionlist,
    required this.mediaquery,
    required this.deletetransaction,
  }) : super(key: key);

  final Transaction transactionlist;
  final MediaQueryData mediaquery;
  final Function deletetransaction;

  @override
  State<TransactionListItem> createState() => _TransactionListItemState();
}

class _TransactionListItemState extends State<TransactionListItem> {
  late Color _bgColor;

  @override
  void initState() {
    const colorcollection = [
      Colors.blueAccent,
      Colors.purple,
      Colors.orange,
      Colors.pink,
    ];

    _bgColor = colorcollection[Random().nextInt(colorcollection.length - 1)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widgetransaction = widget.transactionlist;

    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: _bgColor,
            radius: 30,
            child: FittedBox(
                child: Text(
              DateFormat.E().format(widgetransaction.date).substring(0, 1),
              style: Theme.of(context).textTheme.headline1,
            )),
          ),
          title: Text(widgetransaction.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMEEEEd().format(widgetransaction.date)),
              Container(
                margin: EdgeInsets.only(top: 3.0),
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green[600],
                  ),
                  child: Text('Amount: ${widgetransaction.amount.toString()}',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
          trailing: widget.mediaquery.size.width > 360
              ? TextButton.icon(
                  onPressed: () =>
                      widget.deletetransaction(widgetransaction.id),
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.red,
                  ))
              : IconButton(
                  onPressed: () =>
                      widget.deletetransaction(widgetransaction.id),
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor),
        ),
      ),
    );
  }
}
