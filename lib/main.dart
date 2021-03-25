import 'package:blogapp1/displayPage.dart';
import 'package:blogapp1/homePage.dart';
import 'package:blogapp1/myBlog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Blogs',
      home: HomePage(),
    );
  }
}




