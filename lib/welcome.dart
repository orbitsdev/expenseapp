import 'package:expenseapp/models/transaction.dart';
import 'package:expenseapp/widgets/chart.dart';
import 'package:expenseapp/widgets/new_transaction.dart';
import 'package:expenseapp/widgets/transaction_list.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 'ta', title: 'New House', amount: 10.00, date: DateTime.now()),
    Transaction(id: 't1', title: 'Burger', amount: 20.00, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Groceries', amount: 10.00, date: DateTime.now()),
  ];

  bool _isShow = false;
  List<Transaction> get _recentTransaction {
    return _userTransaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime choosendate) {
    final newusertransaction = Transaction(
        id: DateTime.now().toString(),
        title: title.toUpperCase(),
        amount: amount,
        date: choosendate);

    setState(() {
      _userTransaction.add(newusertransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(addtransaction: _addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  List<Widget> _forLandScapeScreen(
      MediaQueryData mediaquery, AppBar appBar, Widget listWediget) {
    return [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Show Chart'),
        Switch(
            value: _isShow,
            onChanged: (val) {
              setState(() {
                _isShow = val;
              });
            }),
      ]),
      _isShow
          ? Container(
              height: (mediaquery.size.height -
                      appBar.preferredSize.height -
                      mediaquery.padding.top) *
                  0.7,
              child: Chart(recentTransaction: _recentTransaction))
          : listWediget,
    ];
  }

  List<Widget> _forPortraitScreen(
      MediaQueryData mediaquery, AppBar appBar, Widget listWediget) {
    return [
      Container(
        height: (mediaquery.size.height -
                appBar.preferredSize.height -
                mediaquery.padding.top) *
            0.3,
        child: Chart(recentTransaction: _recentTransaction),
      ),
      listWediget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);

    // return boolean data. check if the phonse is on landscape mode
    final isLandScape = mediaquery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text('Expense App', style: Theme.of(context).textTheme.headline1),
      actions: [
        IconButton(
            onPressed: () {
              _startAddNewTransaction(context);
            },
            icon: Icon(Icons.add)),
      ],
    );
    final listWediget = Column(
      children: [
        Container(
          height: (mediaquery.size.height -
                  appBar.preferredSize.height -
                  mediaquery.padding.top) *
              0.7,
          child: TransactionList(
              transactionlist: _userTransaction,
              deletetransaction: _deleteTransaction),
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          if (isLandScape)
            ..._forLandScapeScreen(mediaquery, appBar, listWediget),
          if (!isLandScape)
            ..._forPortraitScreen(mediaquery, appBar, listWediget),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
