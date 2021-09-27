import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:sabak0901/bitcoin/repository/repository.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCurrency = "AUD";
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(
        currency,
        style: TextStyle(color: Colors.white),
      ));
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(200),
      child: SizedBox(
        width: 200,
        height: 100,
        child: CircleAvatar(
          child: CupertinoPicker(
            backgroundColor: Colors.black,
            itemExtent: 32.0,
            onSelectedItemChanged: (selectedIndex) {
              setState(() {
                selectedCurrency = currenciesList[selectedIndex];
                getData();
              });
            },
            children: pickerItems,
          ),
        ),
      ),
    );
  }

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  Column makeCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          cryptoCurrency: crypto,
          selectedCurrency: selectedCurrency,
          value: isWaiting ? "45" : coinValues[crypto].toString(),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bitcoin Api App"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              makeCards(),
              SizedBox(
                height: 20,
              ),
              iOSPicker()
            ],
          ),
        ),
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    required this.value,
    required this.selectedCurrency,
    required this.cryptoCurrency,
  });

  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 8, bottom: 8, right: 50),
      height: 140,
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          Sparkline(
            data: [
              double.parse(value) - 5,
              double.parse(value) + 5,
              double.parse(value) - 7,
              double.parse(value) + 5,
              double.parse(value) + 3,
              double.parse(value),
            ],
            lineColor: Colors.cyan,
            //fillMode: FillMode.below,
            fillColor: Colors.white10,
            pointsMode: PointsMode.all,
            pointSize: 4.0,
            pointColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
