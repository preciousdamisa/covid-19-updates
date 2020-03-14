import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  final Map<String, dynamic> covidInfo;

  InfoCard(this.covidInfo);

  @override
  Widget build(BuildContext context) {
    Color textColor;
    String text;
    if (covidInfo['update'] == 'cases') {
      textColor = Colors.grey;
      text = 'Cases';
    } else if (covidInfo['update'] == 'suspected') {
      textColor = Colors.red[300];
      text = 'Suspected';
    } else if (covidInfo['update'] == 'confirmed') {
      textColor = Colors.red[600];
      text = 'Confirmed';
    } else if (covidInfo['update'] == 'deaths') {
      textColor = Colors.black;
      text = 'Deaths';
    } else if (covidInfo['update'] == 'recovered') {
      textColor = Colors.green[600];
      text = 'Recovered';
    }
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    DateFormat.yMEd()
                        .add_jms()
                        .format(DateTime.parse(covidInfo['date'])),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              DataBox(
                data: covidInfo['data'].toString(),
                update: covidInfo['update'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataBox extends StatelessWidget {
  final String data;
  final String update;

  DataBox({this.data, this.update});

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    if (update == 'cases') {
      borderColor = Colors.grey;
    } else if (update == 'suspected') {
      borderColor = Colors.red[300];
    } else if (update == 'confirmed') {
      borderColor = Colors.red[600];
    } else if (update == 'deaths') {
      borderColor = Colors.black;
    } else if (update == 'recovered') {
      borderColor = Colors.green[600];
    }
    return Container(
      padding: EdgeInsets.all(5),
      child: Text(data),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 5),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
