import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LikedCurrenciesPage extends StatelessWidget {
  final List<String> likedCurrencies;

  LikedCurrenciesPage({required this.likedCurrencies});

  Future<List<dynamic>> _getLikedCurrenciesData() async {
    final response = await http.get(Uri.parse('https://min-api.cryptocompare.com/data/top/mktcapfull?limit=50&tsym=USD'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final allCurrencies = data['Data'];
      return allCurrencies.where((currency) {
        final coinInfo = currency['CoinInfo'];
        return likedCurrencies.contains(coinInfo['Name']);
      }).toList();
    } else {
      throw Exception('Failed to load crypto prices');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Currencies'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _getLikedCurrenciesData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No liked currencies'));
          } else {
            final likedCurrenciesData = snapshot.data!;
            return ListView.builder(
              itemCount: likedCurrenciesData.length,
              itemBuilder: (context, index) {
                final currency = likedCurrenciesData[index];
                final coinInfo = currency['CoinInfo'];
                final priceInfo = currency['RAW']['USD'];

                return ListTile(
                  leading: Image.network('https://www.cryptocompare.com${coinInfo['ImageUrl']}', width: 50),
                  title: Text(coinInfo['FullName']),
                  subtitle: Text(coinInfo['Name']),
                  trailing: Text('\$${priceInfo['PRICE'].toStringAsFixed(2)}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
