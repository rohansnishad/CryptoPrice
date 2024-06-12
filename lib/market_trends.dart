import 'package:flutter/material.dart';

class MarketTrendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market Trends'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Crypto Market Trends',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildTrendItem(
                  title: 'Bitcoin',
                  subtitle: 'BTC',
                  changePercentage: '+2.5%',
                  isPositiveChange: true,
                ),
                _buildTrendItem(
                  title: 'Ethereum',
                  subtitle: 'ETH',
                  changePercentage: '-1.8%',
                  isPositiveChange: false,
                ),
                _buildTrendItem(
                  title: 'Ripple',
                  subtitle: 'XRP',
                  changePercentage: '+5.2%',
                  isPositiveChange: true,
                ),
                // Add more trend items as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendItem({
    required String title,
    required String subtitle,
    required String changePercentage,
    required bool isPositiveChange,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isPositiveChange ? Colors.green : Colors.red,
        child: Text(subtitle),
      ),
      title: Text(title),
      subtitle: Text('Change: $changePercentage'),
      trailing: Icon(
        isPositiveChange ? Icons.arrow_upward : Icons.arrow_downward,
        color: isPositiveChange ? Colors.green : Colors.red,
      ),
    );
  }
}
