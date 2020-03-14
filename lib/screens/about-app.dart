import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            AboutCard(
              title: 'Info',
              description:
                  'Covid-19 Updates provides access to the latest information on the Covid-19 Virus. Fetches its data from nubentos, API-nCoV2019 - 1.0.0',
            ),
            SizedBox(height: 10),
            AboutCard(
              title: 'Developer',
              picture: 'images/profile_pic.jpg',
              description:
                  'Precious Damisa is a Developer at PiedTech Solutions. Specialized in Mobile development (Flutter) and Node.js',
            ),
          ],
        ),
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  final String title;
  final String description;
  final String picture;

  AboutCard({
    this.title,
    this.description,
    this.picture,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              picture == null ? Container() : SizedBox(height: 10),
              picture == null
                  ? Container()
                  : CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(picture),
                    ),
              SizedBox(height: 10),
              Text(description, style: TextStyle(
                fontSize: 16,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
