import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graphedemo/loading.dart';
import 'package:http/http.dart';

class Item4 extends StatefulWidget {


  Item4({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Item4State createState() => _Item4State();
}

class _Item4State extends State<Item4> {

  Map data;

  void getinfo() async{
    Response response = await get("https://developers.thegraphe.com/dummy/public/api/product/4");
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

  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    if(data == null){
      return Loading();
    }else{
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 2,
          child:Image.asset(favourite? "assets/images/heart_icon.png" : "assets/images/heart_icon_disabled.png",
            width: 30,
            height: 30,),
            backgroundColor: Colors.white,
            onPressed: (){
              setState(() {
                favourite = !favourite;
              });
            }
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        //The whole application area
        body:SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    appBar(),
                    Image.asset(
                      "assets/images/laptop.png",
                      height: 320.0,
                      width: double.infinity,
                    ), //This
                    // should be a paged
                    // view.
                  ],
                ),
              ),
              spaceVertical(20),
              //Center Items
              Expanded (
                child: sections(),
              ),
              purchase()
            ],
          ),
        ),
      );
    }
  }


  Widget appBar(){
    return Container(
      padding: EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Container(
            child: Column(
             children: <Widget>[
               Text("GrapheDemo",
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 14
                ),
               ),
               Text(
                 (data["name"].toString()), 
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)
                ),
               ),
             ],
            ),
          ),
          Image.asset("assets/images/bag_button.png", width: 27, height: 30,),
        ],
      ),
    );
  }

  Widget sections(){
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text(
            data["description"].toString(),
            textAlign: TextAlign.justify,
            style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),),
          spaceVertical(50),
        ],
      ),
    );
  }


  Widget purchase(){
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
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
          Row(
            children: <Widget>[
              Text(
                (data["price"].toString()),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w100,
                  color: Color(0xFF2F2F3E)
                ),
              ),
              Text(
                " र",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFF2F2F3E)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget spaceVertical(double size){
    return SizedBox(height: size,);
  }

  Widget spaceHorizontal(double size){
    return SizedBox(width: size,);
  }

}
