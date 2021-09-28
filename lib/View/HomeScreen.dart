import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List> getData() async {
    var data = await http
        .get(Uri.parse("https://saurav.tech/NewsAPI/everything/cnn.json"));
    print(jsonDecode(data.body)["articles"]);
    return jsonDecode(data.body)["articles"];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("New App"),
              centerTitle: true,
              elevation: 0,
            ),
            body: FutureBuilder<List>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              // We will Open Browser for the url
                              var _url = snapshot.data![index]["url"];
                              // await canLaunch(_url)
                              // ?
                              await launch(_url);
                              // : throw 'Could not launch $_url';
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.network(
                                    snapshot.data![index]["urlToImage"],
                                  ),
                                  Text(
                                    snapshot.data![index]["title"],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(snapshot.data![index]["description"])
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return CircularProgressIndicator();
                })));
  }
}
