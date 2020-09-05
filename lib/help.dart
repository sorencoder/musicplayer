import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';
class Help extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Help'),
       backgroundColor: Colors.redAccent,
     ),
     body: Padding(
       padding: EdgeInsets.all(8.0),
       child: Container(
         child: Column(
           children: [
             Text('This app is currently in development phase so there are lots of bug you may experience'),
             Text('This app has very limited functionality available as of now'),
             Text('Content availability is also very limited which will solve in the future update'),
             Text('This app is only for streaming music from the internet. And we currently do not provide any download functionality'),
             Text('This app stream music files from different sites. So we don\'t own the copyright licences'),
             Text('This app is inspire from Google Music Play and many of the design elements are taken from it'),
             Text('We hope that you will enjoy the app as much as we did while creating it'),
             Text('As always you can provide with any bugs, suggestion, feature request via feedback'),
             Text('Thank you...'),
           ],
         ),
       ),
     ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.feedback),
       onPressed: (){
         Wiredash.of(context).show();
       },
     ),
   );
  }
}