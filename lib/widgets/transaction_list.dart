import 'package:flutter/material.dart';

import 'package:expenseapp/models/transaction.dart';

class TransactionList extends StatefulWidget {

  final List<Transaction> transactionlist;
  const TransactionList({
    Key? key,
    required this.transactionlist,
  }) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
                  constraints: BoxConstraints(
                    maxHeight: 300,
                  ),
                  child: ListView.builder(
                      itemCount:  widget.transactionlist.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      width: 2,
                                      color: Colors.purple,
                                    )),
                                    child: Center(
                                      child: Text(
                                         widget.transactionlist[index]
                                            .amount
                                            .toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                         widget.transactionlist[index].title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                         widget.transactionlist[index]
                                            .date
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                );
  }
}