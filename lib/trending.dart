import 'package:flutter/material.dart';
class Trending extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trending Songs'),backgroundColor: Colors.redAccent,),
      body:Center(
        child: Text('No Data Available',style: TextStyle(fontSize: 20),),
      ) ,
    );
  }
}