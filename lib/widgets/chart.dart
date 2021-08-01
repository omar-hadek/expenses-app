import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendinPctOfTotal;

  const Chart(this.label, this.spendingAmount, this.spendinPctOfTotal);
  @override
  Widget build(BuildContext context) {


    return LayoutBuilder(builder: (context, constraints) {

      double maxHeight = constraints.maxHeight;
      final double barheight = maxHeight * 0.6;
      double textheight = maxHeight * 0.10;
      double spaceHeight = maxHeight * 0.05; 
      double padding  = (maxHeight * 0.1)/4;


      return Container(
        padding: EdgeInsets.all(padding),
        child: Column(children: [
          // Chart Title
          Container(
            height: textheight,
            child: FittedBox(
              child: Text('\$${spendingAmount.toStringAsFixed(1)}'),
            ),
          ),
          SizedBox(height: spaceHeight,),
          // Chart bar
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: barheight,
                width: 10.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(width: 0.6, color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Container(
                height: spendingAmount / spendinPctOfTotal * barheight > barheight
                    ? barheight
                    : spendingAmount / spendinPctOfTotal * barheight,
                width: 10.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ],
          ),
          SizedBox(height:spaceHeight),
          Container(
            height: textheight,
            child: Text(
              label,
            ),
          ),
        ]),
      );
    });
  }
}
