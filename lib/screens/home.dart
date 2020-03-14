import 'package:flutter/material.dart';

import '../components/info-card.dart';
import '../models/covid-data.dart';
import '../screens/about-app.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoading = false;
  Map<String, dynamic> covidInfo = {};

  @override
  void initState() {
    super.initState();

    getCovidData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Updates'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              getCovidData();
            },
          ),
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutAppScreen(),
                    ),
                  )),
          SizedBox(width: 10)
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: infoCards(),
              ),
            ),
    );
  }

  List<Widget> infoCards() {
    final List<InfoCard> infoCards = [];

    for (var covidUpdate in CovidData.covidUpdatesList) {
      final covidData = {
        'date': covidInfo[covidUpdate]['date'],
        'update': covidUpdate,
        'data': covidUpdate == 'cases'
            ? covidInfo[covidUpdate]['cases']
            : covidInfo[covidUpdate]['data']
      };

      final infoCard = InfoCard(covidData);
      infoCards.add(infoCard);
    }

    return infoCards;
  }

  void getCovidData() async {
    setState(() {
      isLoading = true;
    });

    covidInfo = await CovidData.fetchData();
    setState(() {
      isLoading = false;
    });
  }
}
