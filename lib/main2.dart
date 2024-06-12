// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'crypto_detail.dart';
//
//
//
// class CryptoPriceApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Crypto Currency Prices',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CryptoPriceList(),
//     );
//   }
// }
//
// class CryptoPriceList extends StatefulWidget {
//   @override
//   _CryptoPriceListState createState() => _CryptoPriceListState();
// }
//
// class _CryptoPriceListState extends State<CryptoPriceList> {
//   List _currencies = [];
//   List _filteredCurrencies = [];
//   TextEditingController _searchController = TextEditingController();
//
//   Future<void> getCryptoPrices() async {
//     final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'));
//     if (response.statusCode == 200) {
//       setState(() {
//         _currencies = json.decode(response.body);
//         _filteredCurrencies = _currencies;
//       });
//     } else {
//       throw Exception('Failed to load crypto prices');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getCryptoPrices();
//     _searchController.addListener(_filterCurrencies);
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   void _filterCurrencies() {
//     final query = _searchController.text.toLowerCase();
//     setState(() {
//       _filteredCurrencies = _currencies.where((currency) {
//         final name = currency['name'].toLowerCase();
//         return name.contains(query);
//       }).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: _searchController,
//           decoration: InputDecoration(
//             hintText: 'Search...',
//             border: InputBorder.none,
//             hintStyle: TextStyle(color: Colors.white54),
//           ),
//           style: TextStyle(color: Colors.white, fontSize: 18.0),
//         ),
//       ),
//       body: _filteredCurrencies.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: _filteredCurrencies.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Image.network(_filteredCurrencies[index]['image'], width: 50),
//             title: Text(_filteredCurrencies[index]['name']),
//             trailing: Text('\$${ _filteredCurrencies[index]['current_price']}'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CryptoDetail(
//                     id: _filteredCurrencies[index]['id'],
//                     name: _filteredCurrencies[index]['name'],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }






//
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'crypto_detail.dart';
//
//
//
// class CryptoPriceApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Crypto Currency Prices',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CryptoPriceList1(),
//     );
//   }
// }
//
// class CryptoPriceList1 extends StatefulWidget {
//   @override
//   _CryptoPriceListState createState() => _CryptoPriceListState();
// }
//
// class _CryptoPriceListState extends State<CryptoPriceList1> {
//   List _currencies = [];
//   List _filteredCurrencies = [];
//   TextEditingController _searchController = TextEditingController();
//
//   Future<void> getCryptoPrices() async {
//     final response = await http.get(Uri.parse('https://min-api.cryptocompare.com/data/top/mktcapfull?limit=50&tsym=USD'));
//     if (response.statusCode == 200) {
//       setState(() {
//         final data = json.decode(response.body);
//         _currencies = data['Data'];
//         _filteredCurrencies = _currencies;
//       });
//     } else {
//       throw Exception('Failed to load crypto prices');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getCryptoPrices();
//     _searchController.addListener(_filterCurrencies);
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   void _filterCurrencies() {
//     final query = _searchController.text.toLowerCase();
//     setState(() {
//       _filteredCurrencies = _currencies.where((currency) {
//         final name = currency['CoinInfo']['FullName'].toLowerCase();
//         return name.contains(query);
//       }).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Crypto Currency Prices'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: _filteredCurrencies.isEmpty
//                 ? Center(child: CircularProgressIndicator())
//                 : ListView.builder(
//               itemCount: _filteredCurrencies.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.network('https://www.cryptocompare.com${_filteredCurrencies[index]['CoinInfo']['ImageUrl']}', width: 50),
//                   title: Text(_filteredCurrencies[index]['CoinInfo']['FullName']),
//                   trailing: Text('\$${_filteredCurrencies[index]['RAW']['USD']['PRICE'].toStringAsFixed(2)}'),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CryptoDetail(
//                           id: _filteredCurrencies[index]['CoinInfo']['Name'],
//                           name: _filteredCurrencies[index]['CoinInfo']['FullName'],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






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
            : Text('Crypto Currency Prices'),
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
                // Add your onTap code here!
              },
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('Market Trends'),
              onTap: () {
                // Add your onTap code here!
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Add your onTap code here!
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
                return ListTile(
                  leading: Image.network('https://www.cryptocompare.com${_filteredCurrencies[index]['CoinInfo']['ImageUrl']}', width: 50),
                  title: Text(_filteredCurrencies[index]['CoinInfo']['FullName']),
                  trailing: Text('\$${_filteredCurrencies[index]['RAW']['USD']['PRICE'].toStringAsFixed(2)}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CryptoDetail(
                          id: _filteredCurrencies[index]['CoinInfo']['Name'],
                          name: _filteredCurrencies[index]['CoinInfo']['FullName'],
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

