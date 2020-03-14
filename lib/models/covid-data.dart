import 'package:http/http.dart' as http;

import 'dart:convert';

class CovidData {
  static final covidUpdatesList = [
    'cases',
    'suspected',
    'confirmed',
    'deaths',
    'recovered'
  ];

  static Future<Map<String, dynamic>> fetchData() async {
    Map<String, dynamic> covidData = {};

    for (var covidUpdate in covidUpdatesList) {
      var url = '';
      if (covidUpdate == 'cases' ||
          covidUpdate == 'deaths' ||
          covidUpdate == 'recovered') {
        url =
            'https://apigw.nubentos.com:443/t/nubentos.com/ncovapi/1.0.0/$covidUpdate';
      } else if (covidUpdate == 'suspected' || covidUpdate == 'confirmed') {
        url =
            'https://apigw.nubentos.com:443/t/nubentos.com/ncovapi/1.0.0/cases/$covidUpdate';
      }

      final response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization':
            'Authorization : Bearer 5c33c683-a628-35da-8182-a3c3989ffc2c'
      });

      var decodedResponse = jsonDecode(response.body)[0];

      covidData[covidUpdate] = decodedResponse;
    }
    return covidData;
  }
}
