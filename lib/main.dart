import 'package:daap/market_trends.dart';
import 'package:daap/setting.dart';
import 'package:daap/wallet.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'crypto_detail.dart';

void main() => runApp(CryptoPriceApp1());

class CryptoPriceApp1 extends StatefulWidget {
  @override
  _CryptoPriceApp1State createState() => _CryptoPriceApp1State();
}

class _CryptoPriceApp1State extends State<CryptoPriceApp1> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleThemeMode() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Currency Prices',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: CryptoPriceList1(
        themeMode: _themeMode,
        toggleThemeMode: _toggleThemeMode,
      ),
    );
  }
}

class CryptoPriceList1 extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback toggleThemeMode;

  CryptoPriceList1({required this.themeMode, required this.toggleThemeMode});

  @override
  _CryptoPriceListState createState() => _CryptoPriceListState();
}

class _CryptoPriceListState extends State<CryptoPriceList1> {
  List _currencies = [];
  List _filteredCurrencies = [];
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  Future<void> getCryptoPrices() async {
    final response = await http.get(Uri.parse('https://min-api.cryptocompare.com/data/top/mktcapfull?limit=50&tsym=USD'));
    if (response.statusCode == 200) {
      setState(() {
        final data = json.decode(response.body);
        _currencies = data['Data'];
        _filteredCurrencies = _currencies;
        print('Loaded ${_currencies.length} cryptocurrencies');  // Debug print statement
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
        final name = currency['CoinInfo']['FullName'].toLowerCase();
        return name.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          autofocus: true,
        )
            : Center(child: Text('CryptoPrices')),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                }
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu', style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Wallet'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WalletPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('Market Trends'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MarketTrendsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Add your onTap code here!
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(widget.themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
              title: Text('Dark Mode'),
              trailing: Switch(
                value: widget.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  widget.toggleThemeMode();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _filteredCurrencies.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _filteredCurrencies.length,
              itemBuilder: (context, index) {
                final currency = _filteredCurrencies[index];
                final coinInfo = currency['CoinInfo'];
                final priceInfo = currency['RAW']['USD'];

                return ListTile(
                  leading: Image.network('https://www.cryptocompare.com${coinInfo['ImageUrl']}', width: 50),
                  title: Text(coinInfo['FullName']),
                  subtitle: Text(coinInfo['Name']),
                  trailing: Text('\$${priceInfo['PRICE'].toStringAsFixed(2)}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CryptoDetail(
                          id: coinInfo['Name'],
                          name: coinInfo['FullName'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
