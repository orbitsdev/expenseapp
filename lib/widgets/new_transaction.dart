import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtransaction;
   NewTransaction({
    Key? key,
    required this.addtransaction,
  }) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController =  TextEditingController();
  final amountController =  TextEditingController();

  void submitData(){

            widget.addtransaction(
            titleController.text,
            double.parse(amountController.text),
 
          );
          
      Navigator.of(context).pop();
       
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            labelText: 'Title',
          ),
          onSubmitted: (_)=> submitData(),
        ),
        TextField(
          controller: amountController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            labelText: 'Amount',
          ),

          keyboardType: TextInputType.numberWithOptions(decimal: true),
          onSubmitted: (_)=> submitData(),
         
        ),
        TextButton(onPressed: submitData , child: Text('Add Transaction')),
      ],
    );
  }
}
