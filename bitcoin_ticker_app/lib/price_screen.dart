import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'apicaller.dart';

class PriceScreen extends StatefulWidget {
  // final dynamic currencydata;
  // PriceScreen({super.key, required this.currencydata});
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  late String currenyName = 'USD';
  late String cryptoPriceBTC = '?';
  late String cryptoPriceETH = '?';
  late String cryptoPriceLTC = '?';
  CoinData coinData = CoinData();
  dynamic currencyDataBtc;
  dynamic currencyDataEth;
  dynamic currencyDataLtc;

  void initState() {
    super.initState();
    updateUi();
  }

  void updateUi() async {
    if (currencyDataBtc == null) {
      currencyDataBtc = await ApiCaller().apiKeyDataBtc();
    }
    if (currencyDataEth == null) {
      currencyDataEth = await ApiCaller().apiKeyDataEth();
    }
    if (currencyDataLtc == null) {
      currencyDataLtc = await ApiCaller().apiKeyDataLtc();
    }
    setState(() {
      cryptoPriceBTC = (currencyDataBtc[currenyName]).toString();
      cryptoPriceETH = (currencyDataEth[currenyName]).toString();
      cryptoPriceLTC = (currencyDataLtc[currenyName]).toString();
    });
    // print(cryptoPriceBTC);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: [
                cardCreator('${coinData.cryptoList[0]}', '$cryptoPriceBTC'),
                cardCreator('${coinData.cryptoList[1]}', '$cryptoPriceETH'),
                cardCreator('${coinData.cryptoList[2]}', '$cryptoPriceLTC'),
              ],
            ),
          ),
          Center(
            child: Text(
              '$currenyName',
              style: TextStyle(fontSize: 100.0, color: Colors.black),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (dynamic itemIndex) {
                  currenyName = coinData.currenciesList[itemIndex];
                  updateUi();
                },
                children: coinData.widgetListPicker()),
          ),
        ],
      ),
    );
  }

  Widget cardCreator(String cryptoName, String cryptoPrice) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptoName = $cryptoPrice $currenyName',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
// DropdownButton<String>(
// value: currenyName,
// items: CoinData().getMenuItem(),
// onChanged: (dynamic value) {
// setState(() {
// currenyName = value;
// });
// })
// Card(
// color: Colors.lightBlueAccent,
// elevation: 5.0,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0),
// ),
// child: Padding(
// padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
// child: Text(
// '1 BTC = $cryptoPrice $currenyName',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 20.0,
// color: Colors.white,
// ),
// ),
// ),
// ),
