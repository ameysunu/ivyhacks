import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ivyhacks/login.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#F8D1B9'),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Hexcolor('#F8D1B9'),
        title: Text(
          "Welcome $name",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/main.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: Hexcolor('#FFCFFF'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Symptoms",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                color: Hexcolor('#40577A')),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10),
                          child: Text(
                            "Tell us how you be feeling?",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Hexcolor('#40577A')),
                          ),
                        ),
                        Row(
                          children: [],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: Hexcolor('#FFBD95'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Meds Check",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                color: Hexcolor('#40577A')),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10),
                          child: Text(
                            "Check your medicines, if you don't trust them.",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Hexcolor('#40577A')),
                          ),
                        ),
                        Row(
                          children: [],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/news.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "News",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Get latest live news",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    child: InkWell(
                                        child: Image.network(
                                            "https://seeklogo.com/images/B/bbc-news-logo-8648ABD044-seeklogo.com.png"),
                                        onTap: () async {
                                          const url =
                                              'https://www.bbc.com/news/health';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    child: InkWell(
                                        child: Image.network(
                                            "https://seeklogo.com/images/C/CNN-logo-8DA6D1FC28-seeklogo.com.png"),
                                        onTap: () async {
                                          const url =
                                              'https://edition.cnn.com/health';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    child: InkWell(
                                        child: Image.network(
                                            "https://seeklogo.com/images/N/NBC_News-logo-5C6AD015E2-seeklogo.com.png"),
                                        onTap: () async {
                                          const url =
                                              'https://www.nbcnews.com/health';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
