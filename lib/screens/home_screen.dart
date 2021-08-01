import 'package:expenses_app/Data/data.dart';
import 'package:expenses_app/Models/transaction.dart';
import 'package:expenses_app/widgets/charts_card.dart';
import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/transaction_card_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTx = new Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);
    setState(() {
      transactions.add(newTx);
    });
  }

  _addtransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
              child: NewTransaction(addtx: _addNewTransaction),
              onTap: () {},
              behavior: HitTestBehavior.opaque);
        });
  }

  void _deleteTrx(String id) {
    setState(() {
      transactions.removeWhere((tr) {
        return tr.id == id;
      });
    });
  }

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  bool _switchVal = false;

  @override
  Widget build(BuildContext context) {
    final _idLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appbar = AppBar(
      title: Text('Personal Expenses'),
      actions: [
        IconButton(
          onPressed: () => _addtransaction(context),
          icon: Icon(Icons.add),
        ),
      ],
    );

    _chartsCard(double percentage) {
      return Container(
        child: ChartsCard(_recentTransactions),
        height: (MediaQuery.of(context).size.height -
                appbar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            percentage,
      );
    }
    _trxCard(double percentage) {
      return Container(
        height: (MediaQuery.of(context).size.height -
                appbar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.7,
        child:
            TransactionCardList(trxlist: transactions, deletetrx: _deleteTrx),
      );
    }

    return Scaffold(
      appBar: appbar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: transactions.length >= 1
              ? Column(
                  children: [
                    if (!_idLandscape) _chartsCard(0.3),
                    if (!_idLandscape) _trxCard(0.7),
                    if (_idLandscape)
                      Switch(
                          value: _switchVal,
                          onChanged: (val) {
                            setState(() {
                              _switchVal = val;
                            });
                          }),
                    _switchVal ? _chartsCard(0.7) : _trxCard(0.7),
                  ],
                )
              : Container(
                  child: Column(
                    children: [
                      //Container(child: ChartsCard(_recentTransactions),height:400.0 ,),
                      Text(
                        'No Transaction Added Yet ',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Image.asset('assets/images/bg.jpg', fit: BoxFit.cover),
                    ],
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addtransaction(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
