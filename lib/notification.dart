import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Notifications extends StatefulWidget{
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool toggleValue = false;
  bool toggleValue1 = false;
  bool toggleValue2 = false;
  @override
  Widget build(BuildContext context) {
    toggleButton(){
      setState(() {
        toggleValue =! toggleValue;
      });
    }
    toggleButton1(){
      setState(() {
        toggleValue1 =! toggleValue1;
      });
    }
    toggleButton2(){
      setState(() {
        toggleValue2 =! toggleValue2;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Streaming Settings'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 40.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: toggleValue? Colors.greenAccent:Colors.redAccent.withOpacity(0.5),
                    ),
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeIn,
                          top: 3.0,
                          left: toggleValue?60.0:0.0,
                          right: toggleValue?0.0:60.0,
                          child: InkWell(
                            onTap: toggleButton,
                            child: AnimatedSwitcher(
                              duration: Duration(seconds: 1),
                              transitionBuilder: (Widget child, Animation<double> animation){
                                return RotationTransition(
                                  child: child,turns: animation,
                                );
                              },
                              child: toggleValue?Icon(Icons.check_circle, color: Colors.green,size: 35.0,key: UniqueKey(),):Icon(Icons.remove_circle, color: Colors.red,size: 35.0,key: UniqueKey(),),
                            ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 40.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: toggleValue1? Colors.greenAccent:Colors.redAccent.withOpacity(0.5),
                    ),
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeIn,
                          top: 3.0,
                          left: toggleValue1?60.0:0.0,
                          right: toggleValue1?0.0:60.0,
                          child: InkWell(
                            onTap: toggleButton1,
                            child: AnimatedSwitcher(
                              duration: Duration(seconds: 1),
                              transitionBuilder: (Widget child, Animation<double> animation){
                                return RotationTransition(
                                  child: child,turns: animation,
                                );
                              },
                              child: toggleValue1?Icon(Icons.check_circle, color: Colors.green,size: 35.0,key: UniqueKey(),):Icon(Icons.remove_circle, color: Colors.red,size: 35.0,key: UniqueKey(),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 40.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: toggleValue2? Colors.greenAccent:Colors.redAccent.withOpacity(0.5),
                    ),
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeIn,
                          top: 3.0,
                          left: toggleValue2?60.0:0.0,
                          right: toggleValue2?0.0:60.0,
                          child: InkWell(
                            onTap: toggleButton2,
                            child: AnimatedSwitcher(
                              duration: Duration(seconds: 1),
                              transitionBuilder: (Widget child, Animation<double> animation){
                                return RotationTransition(
                                  child: child,turns: animation,
                                );
                              },
                              child: toggleValue2?Icon(Icons.check_circle, color: Colors.green,size: 35.0,key: UniqueKey(),):Icon(Icons.remove_circle, color: Colors.red,size: 35.0,key: UniqueKey(),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}