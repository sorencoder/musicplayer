import 'package:flutter/material.dart';
import 'package:flutter_app/notification.dart';
import 'package:flutter_app/privacy.dart';
class Setting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Settings'),
      backgroundColor: Colors.redAccent,
    ),
    body: ListView(
      children: <Widget>[
        ListTile(
          title: Text('Streaming'),
          subtitle: Text('Choose streaming preferences'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
          },
        ),
        ListTile(
          title: Text('Equalizer'),
          subtitle: Text('Fine tune your music'),
        ),
        ListTile(
          title: Text('Privacy Policy'),
          subtitle: Text('All the stuff you need to know'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Privacy()));
      },
        ),
        ListTile(
          title: Text('About'),
          subtitle: Text('Information about the App'),
          onTap: (){
            showAboutDialog(context: context,
              applicationName: 'Music Player',
              applicationVersion: '1.0.0',
              applicationLegalese: 'This app uses Google play music design element',
            );
          },
        )
      ],
    ),
  );
  }
}