


// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class CryptoDetail extends StatefulWidget {
//   final String id;
//   final String name;
//
//   CryptoDetail({required this.id, required this.name});
//
//   @override
//   _CryptoDetailState createState() => _CryptoDetailState();
// }
//
// class _CryptoDetailState extends State<CryptoDetail> {
//   List<FlSpot> _priceSpots = [];
//   bool _isLoading = true;
//   bool _hasError = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchPriceData();
//   }
//
//   Future<void> _fetchPriceData() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'https://min-api.cryptocompare.com/data/v2/histoday?fsym=${widget.id}&tsym=USD&limit=7'));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List prices = data['Data']['Data'];
//         setState(() {
//           _priceSpots = prices
//               .asMap()
//               .entries
//               .map((e) => FlSpot(e.key.toDouble(), e.value['close'].toDouble()))
//               .toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load price data');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _hasError
//           ? Center(child: Text('Failed to load data'))
//           : Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: LineChart(
//           LineChartData(
//             titlesData: FlTitlesData(show: true),
//             borderData: FlBorderData(
//               show: true,
//               border: Border.all(color: const Color(0xff37434d), width: 1),
//             ),
//             lineBarsData: [
//               LineChartBarData(
//                 spots: _priceSpots,
//                 isCurved: true,
//                 colors: [Colors.blue],
//                 barWidth: 2,
//                 belowBarData: BarAreaData(show: false),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class CryptoDetail extends StatefulWidget {
//   final String id;
//   final String name;
//
//   CryptoDetail({required this.id, required this.name});
//
//   @override
//   _CryptoDetailState createState() => _CryptoDetailState();
// }
//
// class _CryptoDetailState extends State<CryptoDetail> {
//   List<FlSpot> _priceSpots = [];
//   bool _isLoading = true;
//   bool _hasError = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchPriceData();
//   }
//
//   Future<void> _fetchPriceData() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'https://min-api.cryptocompare.com/data/v2/histoday?fsym=${widget.id}&tsym=USD&limit=7'));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List prices = data['Data']['Data'];
//         setState(() {
//           _priceSpots = prices
//               .asMap()
//               .entries
//               .map((e) => FlSpot(e.key.toDouble(), e.value['close'].toDouble()))
//               .toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load price data');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _hasError
//           ? Center(child: Text('Failed to load data'))
//           : Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: LineChart(
//           LineChartData(
//             lineTouchData: LineTouchData(
//               touchTooltipData: LineTouchTooltipData(
//                 tooltipBgColor: Colors.blueAccent,
//                 getTooltipItems: (touchedSpots) {
//                   return touchedSpots.map((touchedSpot) {
//                     return LineTooltipItem(
//                       '\$${touchedSpot.y.toStringAsFixed(2)}',
//                       const TextStyle(color: Colors.white),
//                     );
//                   }).toList();
//                 },
//               ),
//             ),
//             gridData: FlGridData(
//               show: true,
//               drawVerticalLine: true,
//               getDrawingHorizontalLine: (value) {
//                 return FlLine(
//                   color: const Color(0xff37434d),
//                   strokeWidth: 1,
//                 );
//               },
//               getDrawingVerticalLine: (value) {
//                 return FlLine(
//                   color: const Color(0xff37434d),
//                   strokeWidth: 1,
//                 );
//               },
//             ),
//             titlesData: FlTitlesData(
//               show: true,
//               rightTitles: SideTitles(showTitles: false),
//               topTitles: SideTitles(showTitles: false),
//               bottomTitles: SideTitles(
//                 showTitles: true,
//                 reservedSize: 22,
//                 getTextStyles: (context, value) =>
//                 const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 12),
//                 getTitles: (value) {
//                   switch (value.toInt()) {
//                     case 0:
//                       return '1D';
//                     case 1:
//                       return '2D';
//                     case 2:
//                       return '3D';
//                     case 3:
//                       return '4D';
//                     case 4:
//                       return '5D';
//                     case 5:
//                       return '6D';
//                     case 6:
//                       return '7D';
//                   }
//                   return '';
//                 },
//                 margin: 8,
//               ),
//               leftTitles: SideTitles(
//                 showTitles: true,
//                 getTextStyles: (context, value) =>
//                 const TextStyle(color: Color(0xff67727d), fontWeight: FontWeight.bold, fontSize: 12),
//                 getTitles: (value) {
//                   return '\$${value.toInt()}';
//                 },
//                 reservedSize: 32,
//                 margin: 12,
//               ),
//             ),
//             borderData: FlBorderData(
//               show: true,
//               border: Border.all(color: const Color(0xff37434d), width: 1),
//             ),
//             minX: 0,
//             maxX: 6,
//             minY: _priceSpots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b) * 0.9,
//             maxY: _priceSpots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b) * 1.1,
//             lineBarsData: [
//               LineChartBarData(
//                 spots: _priceSpots,
//                 isCurved: true,
//                 colors: [Colors.blue],
//                 barWidth: 3,
//                 isStrokeCapRound: true,
//                 dotData: FlDotData(show: false),
//                 belowBarData: BarAreaData(
//                   show: true,
//                   colors: [Colors.blue.withOpacity(0.3)],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class CryptoDetail extends StatefulWidget {
//   final String id;
//   final String name;
//
//   CryptoDetail({required this.id, required this.name});
//
//   @override
//   _CryptoDetailState createState() => _CryptoDetailState();
// }
//
// class _CryptoDetailState extends State<CryptoDetail> {
//   List<FlSpot> _priceSpots = [];
//   bool _isLoading = true;
//   bool _hasError = false;
//   String _selectedTimeFrame = '7D';
//   double _currentPriceUSD = 0.0;
//   double _currentPriceINR = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchPriceData();
//     _fetchCurrentPrice();
//   }
//
//   Future<void> _fetchPriceData() async {
//     String endpoint = '';
//
//     switch (_selectedTimeFrame) {
//       case '1D':
//         endpoint = 'histominute?fsym=${widget.id}&tsym=USD&limit=1440'; // 1-minute interval for 1 day (24*60)
//         break;
//       case '7D':
//         endpoint = 'histohour?fsym=${widget.id}&tsym=USD&limit=168'; // 1-hour interval for 7 days (7*24)
//         break;
//       case '1M':
//         endpoint = 'histoday?fsym=${widget.id}&tsym=USD&limit=30'; // 1-day interval for 1 month
//         break;
//       case '1Y':
//         endpoint = 'histoday?fsym=${widget.id}&tsym=USD&limit=365'; // 1-day interval for 1 year
//         break;
//     }
//
//     try {
//       final response = await http.get(Uri.parse('https://min-api.cryptocompare.com/data/v2/$endpoint'));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List prices = data['Data']['Data'];
//         setState(() {
//           _priceSpots = prices
//               .asMap()
//               .entries
//               .map((e) => FlSpot(e.key.toDouble(), e.value['close'].toDouble()))
//               .toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load price data');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//       });
//     }
//   }
//
//   Future<void> _fetchCurrentPrice() async {
//     try {
//       final response = await http.get(Uri.parse('https://min-api.cryptocompare.com/data/price?fsym=${widget.id}&tsyms=USD,INR'));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           _currentPriceUSD = data['USD'];
//           _currentPriceINR = data['INR'];
//         });
//       } else {
//         throw Exception('Failed to load current price');
//       }
//     } catch (e) {
//       setState(() {
//         _hasError = true;
//       });
//     }
//   }
//
//   void _onTimeFrameChanged(String? newTimeFrame) {
//     setState(() {
//       _selectedTimeFrame = newTimeFrame!;
//       _isLoading = true;
//       _hasError = false;
//       _fetchPriceData();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double initialPrice = _priceSpots.isNotEmpty ? _priceSpots.first.y : 0;
//     double finalPrice = _priceSpots.isNotEmpty ? _priceSpots.last.y : 0;
//     bool isPositive = finalPrice >= initialPrice;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: DropdownButton<String>(
//               value: _selectedTimeFrame,
//               onChanged: _onTimeFrameChanged,
//               items: <String>['1D', '7D', '1M', '1Y'].map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Current Price: \$${_currentPriceUSD.toStringAsFixed(2)} USD'),
//                 Text('Current Price: ₹${_currentPriceINR.toStringAsFixed(2)} INR'),
//               ],
//             ),
//           ),
//           Expanded(
//             child: _isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : _hasError
//                 ? Center(child: Text('Failed to load data'))
//                 : Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: SizedBox(
//                 height: 200, // Adjust the height to make the graph smaller
//                 child: LineChart(
//                   LineChartData(
//                     lineTouchData: LineTouchData(
//                       touchTooltipData: LineTouchTooltipData(
//                         tooltipBgColor: Colors.blueAccent,
//                         getTooltipItems: (touchedSpots) {
//                           return touchedSpots.map((touchedSpot) {
//                             return LineTooltipItem(
//                               '\$${touchedSpot.y.toStringAsFixed(2)}',
//                               const TextStyle(color: Colors.white),
//                             );
//                           }).toList();
//                         },
//                       ),
//                     ),
//                     gridData: FlGridData(
//                       show: true,
//                       drawVerticalLine: true,
//                       getDrawingHorizontalLine: (value) {
//                         return FlLine(
//                           color: const Color(0xff37434d),
//                           strokeWidth: 1,
//                         );
//                       },
//                       getDrawingVerticalLine: (value) {
//                         return FlLine(
//                           color: const Color(0xff37434d),
//                           strokeWidth: 1,
//                         );
//                       },
//                     ),
//                     titlesData: FlTitlesData(
//                       show: true,
//                       rightTitles: SideTitles(showTitles: false),
//                       topTitles: SideTitles(showTitles: false),
//                       bottomTitles: SideTitles(
//                         showTitles: true,
//                         reservedSize: 22,
//                         getTextStyles: (context, value) =>
//                         const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 12),
//                         getTitles: (value) {
//                           switch (value.toInt()) {
//                             case 0:
//                               return '1D';
//                             case 1:
//                               return '2D';
//                             case 2:
//                               return '3D';
//                             case 3:
//                               return '4D';
//                             case 4:
//                               return '5D';
//                             case 5:
//                               return '6D';
//                             case 6:
//                               return '7D';
//                           }
//                           return '';
//                         },
//                         margin: 8,
//                       ),
//                       leftTitles: SideTitles(
//                         showTitles: true,
//                         getTextStyles: (context, value) =>
//                         const TextStyle(color: Color(0xff67727d), fontWeight: FontWeight.bold, fontSize: 12),
//                         getTitles: (value) {
//                           return '\$${value.toInt()}';
//                         },
//                         reservedSize: 32,
//                         margin: 12,
//                       ),
//                     ),
//                     borderData: FlBorderData(
//                       show: true,
//                       border: Border.all(color: const Color(0xff37434d), width: 1),
//                     ),
//                     minX: 0,
//                     maxX: _priceSpots.length.toDouble() - 1,
//                     minY: _priceSpots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b) * 0.9,
//                     maxY: _priceSpots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b) * 1.1,
//                     lineBarsData: [
//                       LineChartBarData(
//                         spots: _priceSpots,
//                         isCurved: true,
//                         colors: isPositive ? [Colors.green] : [Colors.red],
//                         barWidth: 3,
//                         isStrokeCapRound: true,
//                         dotData: FlDotData(show: false),
//                         belowBarData: BarAreaData(
//                           show: true,
//                           colors: isPositive
//                               ? [Colors.green.withOpacity(0.3)]
//                               : [Colors.red.withOpacity(0.3)],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoDetail extends StatefulWidget {
  final String id;
  final String name;

  CryptoDetail({required this.id, required this.name});

  @override
  _CryptoDetailState createState() => _CryptoDetailState();
}

class _CryptoDetailState extends State<CryptoDetail> {
  List<FlSpot> _priceSpots = [];
  bool _isLoading = true;
  bool _hasError = false;
  String _selectedTimeFrame = '7D';
  double _currentPriceUSD = 0.0;
  double _currentPriceINR = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchPriceData();
    _fetchCurrentPrice();
  }

  Future<void> _fetchPriceData() async {
    String endpoint = '';

    switch (_selectedTimeFrame) {
      case '1D':
        endpoint = 'histominute?fsym=${widget.id}&tsym=USD&limit=1440'; // 1-minute interval for 1 day (24*60)
        break;
      case '7D':
        endpoint = 'histohour?fsym=${widget.id}&tsym=USD&limit=168'; // 1-hour interval for 7 days (7*24)
        break;
      case '1M':
        endpoint = 'histoday?fsym=${widget.id}&tsym=USD&limit=30'; // 1-day interval for 1 month
        break;
      case '1Y':
        endpoint = 'histoday?fsym=${widget.id}&tsym=USD&limit=365'; // 1-day interval for 1 year
        break;
    }

    try {
      final response = await http.get(Uri.parse('https://min-api.cryptocompare.com/data/v2/$endpoint'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List prices = data['Data']['Data'];
        setState(() {
          _priceSpots = prices
              .asMap()
              .entries
              .map((e) => FlSpot(e.key.toDouble(), e.value['close'].toDouble()))
              .toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load price data');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  Future<void> _fetchCurrentPrice() async {
    try {
      final response = await http.get(Uri.parse('https://min-api.cryptocompare.com/data/price?fsym=${widget.id}&tsyms=USD,INR'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _currentPriceUSD = data['USD'];
          _currentPriceINR = data['INR'];
        });
      } else {
        throw Exception('Failed to load current price');
      }
    } catch (e) {
      setState(() {
        _hasError = true;
      });
    }
  }

  void _onTimeFrameChanged(String? newTimeFrame) {
    setState(() {
      _selectedTimeFrame = newTimeFrame!;
      _isLoading = true;
      _hasError = false;
      _fetchPriceData();
    });
  }

  List<LineChartBarData> _generateLineBarsData() {
    List<LineChartBarData> lineBarsData = [];

    if (_priceSpots.isNotEmpty) {
      List<FlSpot> upSpots = [];
      List<FlSpot> downSpots = [];
      bool isUp = _priceSpots[1].y >= _priceSpots[0].y;

      for (int i = 0; i < _priceSpots.length - 1; i++) {
        if ((_priceSpots[i + 1].y >= _priceSpots[i].y) == isUp) {
          if (isUp) {
            upSpots.add(_priceSpots[i]);
          } else {
            downSpots.add(_priceSpots[i]);
          }
        } else {
          if (isUp) {
            upSpots.add(_priceSpots[i]);
            upSpots.add(_priceSpots[i + 1]);
            lineBarsData.add(_generateLineChartBarData(upSpots, Colors.green));
            upSpots = [];
          } else {
            downSpots.add(_priceSpots[i]);
            downSpots.add(_priceSpots[i + 1]);
            lineBarsData.add(_generateLineChartBarData(downSpots, Colors.red));
            downSpots = [];
          }
          isUp = !isUp;
        }
      }

      if (isUp) {
        upSpots.add(_priceSpots.last);
        lineBarsData.add(_generateLineChartBarData(upSpots, Colors.green));
      } else {
        downSpots.add(_priceSpots.last);
        lineBarsData.add(_generateLineChartBarData(downSpots, Colors.red));
      }
    }

    return lineBarsData;
  }

  LineChartBarData _generateLineChartBarData(List<FlSpot> spots, Color color) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      colors: [color],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        colors: [color.withOpacity(0.3)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double initialPrice = _priceSpots.isNotEmpty ? _priceSpots.first.y : 0;
    double finalPrice = _priceSpots.isNotEmpty ? _priceSpots.last.y : 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _hasError
                ? Center(child: Text('Failed to load data', style: Theme.of(context).textTheme.bodyText1))
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SizedBox(
                height: 200, // Adjust the height to make the graph smaller
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: Colors.blueAccent,
                        getTooltipItems: (touchedSpots) {
                          return touchedSpots.map((touchedSpot) {
                            return LineTooltipItem(
                              '\$${touchedSpot.y.toStringAsFixed(2)}',
                              TextStyle(color: Colors.white),
                            );
                          }).toList();
                        },
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Theme.of(context).dividerColor,
                          strokeWidth: 1,
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: Theme.of(context).dividerColor,
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: SideTitles(showTitles: false),
                      topTitles: SideTitles(showTitles: false),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        getTextStyles: (context, value) => TextStyle(
                          color: Theme.of(context).textTheme.bodyText1?.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 0:
                              return '1D';
                            case 1:
                              return '2D';
                            case 2:
                              return '3D';
                            case 3:
                              return '4D';
                            case 4:
                              return '5D';
                            case 5:
                              return '6D';
                            case 6:
                              return '7D';
                          }
                          return '';
                        },
                        margin: 8,
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (context, value) => TextStyle(
                          color: Theme.of(context).textTheme.bodyText1?.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        getTitles: (value) {
                          return '\$${value.toInt()}';
                        },
                        reservedSize: 32,
                        margin: 12,
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Theme.of(context).dividerColor, width: 1),
                    ),
                    minX: 0,
                    maxX: _priceSpots.length.toDouble() - 1,
                    minY: _priceSpots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b) * 0.9,
                    maxY: _priceSpots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b) * 1.1,
                    lineBarsData: _generateLineBarsData(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Current Price: \$${_currentPriceUSD.toStringAsFixed(2)} / ₹${_currentPriceINR.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyText1?.color),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <String>['1D', '7D', '1M', '1Y'].map((String value) {
                return ChoiceChip(
                  label: Text(value),
                  selected: _selectedTimeFrame == value,
                  onSelected: (bool selected) {
                    if (selected) {
                      _onTimeFrameChanged(value);
                    }
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}



