import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Library extends StatefulWidget{
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  Future getData() async{
QuerySnapshot qn = await Firestore.instance.collection('songs').getDocuments();
return qn.documents;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Library'),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
      future: getData(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else{
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){},
                child: Card(child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(snapshot.data[index].data["title"],style: TextStyle(fontSize:18),))),
              );
            },
          );
        }
      },
    ),
    );
  }
}