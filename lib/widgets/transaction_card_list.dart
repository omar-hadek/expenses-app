import 'package:expenses_app/Data/data.dart';
import 'package:expenses_app/Models/transaction.dart';
import 'package:expenses_app/widgets/Transaction_card.dart';
import 'package:flutter/material.dart';


class TransactionCardList extends StatelessWidget {
   final List<Transaction> trxlist;
   final Function deletetrx;
  const TransactionCardList({ Key? key,required this.trxlist ,required this.deletetrx}) : super(key: key);

  
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trxlist.length,
    itemBuilder: (
      context,
      index){
      return TransactionCard(trx: trxlist[index],deleteTrx: deletetrx,);
    });
  }
}