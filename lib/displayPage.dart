import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayPage extends StatefulWidget{
  final String title;
  final String image;
  final String description;

  DisplayPage(this.title, this.image, this.description);
  @override
  _DisplayPageState createState() => _DisplayPageState();

}

class _DisplayPageState extends State<DisplayPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation:0,
        title: Padding(
          padding: const EdgeInsets.only(left:50.0),
          child: Text("Travel Blog Page",style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),),),
        ),

      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

                colors: [
                  Colors.white10,

                  Colors.white,
                  Colors.white,
                  Colors.white,

                  Colors.white10,

                ]
            )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(

                children: [

                  Container(


                    child: Text(widget.title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.yellow,
                    ),),
                  ),
                  Container(decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20.0),
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(widget.image,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        ),),
                  ),

                  Container(
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.description,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}