import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Item2 extends StatefulWidget {
  @override
  _Item2State createState() => _Item2State();
}

class _Item2State extends State<Item2> {


  Map data;

  void getinfo() async{
    Response response = await get("https://developers.thegraphe.com/dummy/public/api/product/2");
    //List data = jsonDecode(response.body);
    this.setState(() { 
     data = jsonDecode(response.body);
    });
  
  }

  @override
  void initState() {
    super.initState();
    this.getinfo();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data == null ? 0 : 1,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                (data["name"].toString()),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "SellerName",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 30.0
                ),
              ),
            ),
            Container(
              height: 350.0,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                elevation: 3.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset("assets/images/mobile.png"),
                  ],
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                (data["description"].toString()),
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                  height: 1.5
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "PRICE: ",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        (data["price"].toString()),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        " Rupee",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FlatButton(child: Text("ADD TO BAG +",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)
              ),
            ), 
            color: Colors.transparent,
              onPressed: (){},
            ),
          ],
        );
      },
    );
  }
}