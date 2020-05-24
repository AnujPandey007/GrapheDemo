import 'package:flutter/material.dart';
import 'package:graphedemo/item1.dart';
import 'package:graphedemo/item2.dart';
import 'package:graphedemo/item3.dart';
import 'package:graphedemo/item4.dart';
import 'package:graphedemo/item5.dart';
import 'package:graphedemo/item6.dart';
import 'package:graphedemo/product.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selecteditem=0;
  var pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        children: <Widget>[  
          Item1(),
          Item2(),
          Item3(),
          Item4(),
          Item5(),
          Item6()
        ],
        onPageChanged: (index) {
          setState(() {
            selecteditem = index;
          });
        },
        controller: pagecontroller,
      ),
    );
  }
}



