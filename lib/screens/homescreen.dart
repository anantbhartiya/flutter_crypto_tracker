import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttercryptotracker/screens/widgets/coincard.dart';
import 'package:http/http.dart' as http;
import 'package:fluttercryptotracker/utils/coin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = json.decode(response.body);
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    fetchCoin();
    // Timer.periodic(const Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crypto Tracker',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
       body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: coinList.length,
        itemBuilder: (context, index) {
          return CoinCard(
            name: coinList[index].name,
            symbol: coinList[index].symbol,
            imageUrl: coinList[index].imageUrl,
            price: coinList[index].price.toDouble(),
            change: coinList[index].change.toDouble(),
            changePercentage: coinList[index].changePercentage.toDouble(),
          );
        },
      )
    );
  }
}