import 'dart:math';

import 'package:flutter/material.dart';
import 'package:play23_5_2021/models/friend.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> productList = [
    Product(name: 'Ihone', price: 2000, count: 0),
    Product(name: 'Android', price: 1500, count: 0),
    Product(name: 'Windows', price: 1000, count: 0),
    Product(name: 'Mac', price: 3000, count: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                productList.length,
                (index) => Card(
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.black54,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          productList[index].name,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          productList[index].price.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (productList[index].count > 0) {
                                  setState(() {
                                    productList[index].count--;
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.arrow_circle_down_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                productList[index].count.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    productList[index].count++;
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.arrow_circle_up_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Product {
  String name;
  double price;
  int count;
  Product({this.name = '', this.price = 0, this.count = 0});
}
