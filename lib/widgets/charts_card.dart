import 'package:expenses_app/Models/transaction.dart';
import 'package:expenses_app/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



 class ChartsCard extends StatelessWidget {
    final List<Transaction> recentTransactions;

    ChartsCard(this.recentTransactions);


    List<Map<String,Object>> get groupedTransactions{
      return List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(Duration(days:index));
        var  totalAmount = 0.0;

        for(int i = 0;i<recentTransactions.length;i++){
          if(recentTransactions[i].date.day == weekDay.day &&
          recentTransactions[i].date.month == weekDay.month &&
          recentTransactions[i].date.year == weekDay.year){
            totalAmount += recentTransactions[i].amount;
          }
        }
        return {
          'day':DateFormat.E().format(weekDay).substring(0,1),
          'amount': totalAmount

        };
        
      }).reversed.toList();
    }

    

   @override
   Widget build(BuildContext context) {
     double _maxAmount = 0.0;
    for(int i = 0;i<recentTransactions.length ; i++){
     if(recentTransactions[i].amount > _maxAmount) {
       _maxAmount = recentTransactions[i].amount;
     }
    }
     return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:groupedTransactions.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: Chart(data['day'].toString(),double.parse(data['amount'].toString()),_maxAmount));
          }).toList(),
        ),
      ),
    );
   }
 }

  