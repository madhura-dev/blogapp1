import 'package:blogapp1/foodBlog.dart';
import 'package:blogapp1/foodPage.dart';
import 'package:blogapp1/myBlog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,


      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,

        colors: [
        Colors.white,
        Colors.blueAccent,
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.blueAccent,
        Colors.white,



    ]
    )
    ),

          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("My Blogs",style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left:40.0, right: 40.0),
                child: RaisedButton(
                  onPressed: (){},
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>MyBlogs()));
                    },

                    child: Text("Travel Blog",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.black,
                    ),),
                  ),

                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.only(left:40.0, right: 40.0),
                child: RaisedButton(
                  onPressed: (){},
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> FoodBlog()));
                    },
                    child: Text("Food Blog",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                    ),
                  ),

                ),
              ),



            ],

          ),
        ),

      ),

    );
  }
}
