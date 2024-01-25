import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCaller {
  static const String urlHeader =
      'https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR,AUD,BRL,CAD,CNY,GBP,HKD,IDR,ILS,MXN,NZD,PLN,RON,RUB,SGD,ZAR';
  static const String apiKey =
      'c1eaded2d16f59d4d4b05829de11dbb2af9a4a07d11f74ebdac7315f537c6101';

  Future<dynamic> apiKeyDataBtc() async {
    String url =
        'https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR,AUD,BRL,CAD,CNY,GBP,HKD,IDR,ILS,MXN,NZD,PLN,RON,RUB,SGD,ZAR&api_key=$apiKey';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> apiKeyDataEth() async {
    String url =
        'https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD,JPY,EUR,AUD,BRL,CAD,CNY,GBP,HKD,IDR,ILS,MXN,NZD,PLN,RON,RUB,SGD,ZAR&api_key=$apiKey';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> apiKeyDataLtc() async {
    String url =
        'https://min-api.cryptocompare.com/data/price?fsym=LTC&tsyms=USD,JPY,EUR,AUD,BRL,CAD,CNY,GBP,HKD,IDR,ILS,MXN,NZD,PLN,RON,RUB,SGD,ZAR&api_key=$apiKey';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
