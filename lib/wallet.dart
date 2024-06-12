import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  // Dummy user data
  double _balanceUSD = 5000.0;
  double _balanceBTC = 2.5;
  List<Transaction> _transactions = [
    Transaction("Received", "USD", 1000.0, "John", DateTime.now()),
    Transaction("Sent", "USD", 500.0, "Sarah", DateTime.now()),
    Transaction("Received", "BTC", 0.1, "David", DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallet"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "\$$_balanceUSD USD",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${_balanceBTC.toStringAsFixed(4)} BTC",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Transaction History",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _transactions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          "${_transactions[index].type}: ${_transactions[index].amount} ${_transactions[index].currency} from ${_transactions[index].source}"),
                      subtitle: Text(
                          "${_transactions[index].date.day}/${_transactions[index].date.month}/${_transactions[index].date.year}"),
                    );
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _depositFunds();
                  },
                  child: Text("Deposit"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _withdrawFunds();
                  },
                  child: Text("Withdraw"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _depositFunds() {
    // Implement deposit functionality
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Deposit Funds"),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Enter amount"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement deposit logic here
                Navigator.pop(context);
              },
              child: Text("Deposit"),
            ),
          ],
        );
      },
    );
  }

  void _withdrawFunds() {
    // Implement withdraw functionality
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Withdraw Funds"),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Enter amount"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement withdraw logic here
                Navigator.pop(context);
              },
              child: Text("Withdraw"),
            ),
          ],
        );
      },
    );
  }
}

class Transaction {
  final String type;
  final String currency;
  final double amount;
  final String source;
  final DateTime date;

  Transaction(this.type, this.currency, this.amount, this.source, this.date);
}
