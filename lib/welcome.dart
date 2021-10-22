import 'package:expenseapp/models/transaction.dart';
import 'package:expenseapp/widgets/new_transaction.dart';
import 'package:expenseapp/widgets/transaction_list.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'Buy Shampoo', amount: 20.00, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Buy Shampoo', amount: 20.00, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Buy Shampoo', amount: 20.00, date: DateTime.now()),
    
  ];
  void _addNewTransaction(String title, double amount){


    if(title.isEmpty|| amount <= 0){
      return;
    }
    
    final newusertransaction =
     Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());
    
    setState(() {

        _userTransaction.add(newusertransaction);


    });
    

  }

  void _startAddNewTransaction(BuildContext context){
    showModalBottomSheet(context: context, builder: (_){
      return GestureDetector(
        onTap: (){
          
        },
        child: NewTransaction(addtransaction: _addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
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
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
            
                TransactionList(transactionlist: _userTransaction),
               
              ],
            ),
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
