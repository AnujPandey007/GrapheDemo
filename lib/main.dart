import 'package:flutter/material.dart';
import 'package:graphedemo/pageview.dart';
import 'package:http/http.dart';
import 'dart:convert';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuizApp",
      home: Hom(),
    );
  }
}

class Hom extends StatefulWidget {
  @override
  _HomState createState() => _HomState();
}

class _HomState extends State<Hom> {

  List data;
  Map bata;

  void getinfo() async{
    Response response = await get("https://www.postman.com/collections/e16b64ed51d98f7be09f");
    //List data = jsonDecode(response.body);
    this.setState(() { 
      var corona = jsonDecode(response.body);
      data = corona["item"];
      bata = corona;
    });
  
  }

  @override
  void initState() {
    super.initState();
    this.getinfo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GrapheShop"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length-1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 250.0,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  elevation: 3.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        (bata["info"]["name"].toString()),
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text("Postman ID"),
                      Text(
                        (data[index+1]["_postman_id"].toString()),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )
                )
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
        },
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.shopping_basket,
          color: Colors.black
        ),
        tooltip: "View Products", 
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}