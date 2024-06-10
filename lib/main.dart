import 'package:daap/main2.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(CryptoPriceApp1());

class CryptoPriceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Currency Prices',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CryptoPriceList(),
    );
  }
}

class CryptoPriceList extends StatefulWidget {
  @override
  _CryptoPriceListState createState() => _CryptoPriceListState();
}

class _CryptoPriceListState extends State<CryptoPriceList> {
  List _currencies = [];
  List _filteredCurrencies = [];
  TextEditingController _searchController = TextEditingController();

  Future<void> getCryptoPrices() async {
    final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'));
    if (response.statusCode == 200) {
      setState(() {
        _currencies = json.decode(response.body);
        _filteredCurrencies = _currencies;
      });
    } else {
      throw Exception('Failed to load crypto prices');
    }
  }

  @override
  void initState() {
    super.initState();
    getCryptoPrices();
    _searchController.addListener(_filterCurrencies);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCurrencies() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCurrencies = _currencies.where((currency) {
        final name = currency['name'].toLowerCase();
        return name.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
          ),
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
      ),
      body: _filteredCurrencies.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _filteredCurrencies.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(_filteredCurrencies[index]['image'], width: 50),
            title: Text(_filteredCurrencies[index]['name']),
            trailing: Text('\$${_filteredCurrencies[index]['current_price']}'),
          );
        },
      ),
    );
  }
}
