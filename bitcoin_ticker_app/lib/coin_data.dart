import 'package:flutter/material.dart';

class CoinData {
  List<String> currenciesList = [
    'AUD',
    'BRL',
    'CAD',
    'EUR',
    'GBP',
    'IDR',
    'ILS',
    'JPY',
    'MXN',
    'NZD',
    'PLN',
    'RON',
    'RUB',
    'SGD',
    'USD',
    'ZAR'
  ];

  List<String> cryptoList = [
    'BTC',
    'ETH',
    'LTC',
  ];

  List<Widget> widgetListPicker() {
    List<Widget> currencyWidgetCupertino = [];
    for (int i = 0; i < currenciesList.length; i++) {
      currencyWidgetCupertino.add(Text(currenciesList[i]));
    }
    return currencyWidgetCupertino;
  }

  List<DropdownMenuItem<String>> getMenuItem() {
    List<DropdownMenuItem<String>> menuItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      menuItems.add(DropdownMenuItem(
        child: Text(currenciesList[i]),
        value: currenciesList[i],
      ));
    }
    return menuItems;
  }
}
