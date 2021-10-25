import 'package:expenseapp/models/transaction.dart';
import 'package:expenseapp/widgets/chart.dart';
import 'package:expenseapp/widgets/new_transaction.dart';
import 'package:expenseapp/widgets/transaction_list.dart';

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
  
    Transaction(
        id: 't1', title: 'Burger', amount: 20.00, date: DateTime.now()),
  
    Transaction(
        id: 't3', title: 'Groceries', amount: 10.00, date: DateTime.now()),
  
   
  ];


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
        title:title.toUpperCase() ,
        amount: amount,
        date: choosendate);

    setState(() {
      _userTransaction.add(newusertransaction);
    });

    
  }

  void _deleteTransaction(String id){

    setState(() {
        _userTransaction.removeWhere((element)=> element.id == id); 
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Expense App', style: Theme.of(context).textTheme.headline1),
        actions: [
          IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Chart(recentTransaction: _recentTransaction),
          Column(
            children: [
              TransactionList(transactionlist: _userTransaction, deletetransaction: _deleteTransaction ),
            ],
          ),
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
