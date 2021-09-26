import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("New App"),
            ),
            body: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.network(
                            "https://cdn.cnn.com/cnnnext/dam/assets/210730111329-20210730-japan-chisako-kakehi-black-widow-super-tease.jpg"),
                        Text("Title"),
                        Text("data")
                      ],
                    ),
                  );
                })));
  }
}
