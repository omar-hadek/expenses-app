import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  NewTransaction({required this.addtx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addtx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker(BuildContext ctx) {
    showDatePicker(
            context: ctx,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'enter the title',
                ),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'enter the title',
                ),
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitData(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_selectedDate == null
                      ? 'no date chosen'
                      : 'picked date :' +
                          DateFormat.yMMMd().format(_selectedDate)),
                  ElevatedButton(
                    onPressed: () => _presentDatePicker(context),
                    child: Text('choose a date'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: submitData,
                child: Text('add transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
