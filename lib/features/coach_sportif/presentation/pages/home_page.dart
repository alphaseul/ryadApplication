import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coach Sportif',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Container(
          child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [Image.asset("assets/image.jpg"), Text("1")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [Image.asset("assets/image.jpg"), Text("2")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [Image.asset("assets/image.jpg"), Text("1")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [Image.asset("assets/image.jpg"), Text("2")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [Image.asset("assets/image.jpg"), Text("1")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [Image.asset("assets/image.jpg"), Text("2")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [Image.asset("assets/image.jpg"), Text("1")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [Image.asset("assets/image.jpg"), Text("2")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [Image.asset("assets/image.jpg"), Text("1")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [Image.asset("assets/image.jpg"), Text("2")],
            ),
          ),
        ],
      )),
    );
  }
}
