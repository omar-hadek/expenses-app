import 'package:expenses_app/Data/data.dart';
import 'package:expenses_app/Models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction trx;
  final Function deleteTrx;
  const TransactionCard({Key? key, required this.trx,required this.deleteTrx}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          child: Container(
            margin: EdgeInsets.all(10.0),
            height: 50.0,
            width: 80.0,
            child: Center(
              child: Container(
                height: 20.0,
                child: FittedBox(
                  child: Text(
                    '\$${trx.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          trx.title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(DateFormat.yMMMd().format(trx.date)),
        trailing: IconButton(
          onPressed: () => deleteTrx(trx.id),
          icon: Icon(Icons.delete),
          iconSize: 33.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
