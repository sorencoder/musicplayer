import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/audioplayer.dart';
import 'package:flutter_app/help.dart';
import 'package:flutter_app/library.dart';
import 'package:flutter_app/setting.dart';
import 'package:flutter_app/trending.dart';
import 'package:wiredash/wiredash.dart';
    void main()=> runApp(MyApp());
class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
   return Wiredash(
     projectId: "music-qqe95d2",
     secret: "fywk4ttlpuzu9x9iedmpw32suljkv2hy",
     navigatorKey: _navigatorKey,
     options: WiredashOptionsData(
       showDebugFloatingEntryPoint: false,
     ),
     child: MaterialApp(
         navigatorKey: _navigatorKey,
         home: HomePage(),
         title: 'Music Player',
       ),
   );
  }
}
class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Future getData() async{
QuerySnapshot qn = await Firestore.instance.collection('songs').getDocuments();
return qn.documents;
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Music Player'),
      backgroundColor: Colors.redAccent,
    ),
    drawer: Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pop();
            },
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Trending()));
            },
            leading: Icon(Icons.trending_up),
            title: Text('Trending'),
          ),
          ListTile(
            onTap: null,
            leading: Icon(Icons.history),
            title: Text('Recent'),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Library()));
            },
            leading: Icon(Icons.library_music),
            title: Text('Music Library'),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context)=>Setting())));
            },
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
            },
            leading: Icon(Icons.help),
            title: Text('Help'),
          ),
        ],
      ),
    ),
    body:FutureBuilder(
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
                onTap: (){ 
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AudioPlayer(
                   title:snapshot.data[index].data["title"],
                    url:snapshot.data[index].data["url"],
                  )));
                },
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