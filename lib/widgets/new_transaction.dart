import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime(0);

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final titleentered = _titleController.text;
    final amountentered = double.parse(_amountController.text);

    if (titleentered.isEmpty ||
        amountentered <= 0 ||
        _selectedDate == DateTime(0)) {
      return;
    }

    widget.addtransaction(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickDate) {
      if (pickDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          controller: _titleController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            labelText: 'Title',
          ),
          onSubmitted: (_) => _submitData(),
        ),
        TextField(
          controller: _amountController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            labelText: 'Amount',
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          onSubmitted: (_) => _submitData(),
        ),
        Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(_selectedDate == DateTime(0)
                    ? 'No Date Selected'
                    : 'Picked Date ${DateFormat.yMd().format(_selectedDate)}'),
              ),
              TextButton(
                  onPressed: _presentDatePicker, child: Text('Choose Date')),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: ElevatedButton(
                onPressed: _submitData, child: Text('Add Transaction'))),
      ],
    );
  }
}
