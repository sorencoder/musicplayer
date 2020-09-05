import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';
class AudioPlayer extends StatefulWidget{
  final String title;
  final String url;
  AudioPlayer({this.title,this.url});
  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  MusicPlayer musicPlayer;
  bool _isPlaying =false;
  double rating = 0.0;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
  initPlatformState(){
    musicPlayer = MusicPlayer();
    musicPlayer.play(MusicItem(
                          albumName: "",
                          artistName: "",
                          trackName: "",
                          url: widget.url,
                          duration: Duration(seconds: 255)));
  }
  void onPlayNext(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.keyboard_arrow_down),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x46000000),
                      offset: Offset(0, 20),
                      spreadRadius: 0,
                      blurRadius: 30,
                    ),
                    BoxShadow(
                      color: Color(0x11000000),
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: AssetImage("assets/images/pexels.jpeg"),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Slider(
                onChanged: (newRating) {
                  setState(() =>rating = newRating  
                  );
                },
               value: rating,
                max: 100,
                min: 0,
                label: rating.toString(),
                activeColor: Color(0xFF5E35B1),
              ),
              SizedBox(
                height:20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      if(_isPlaying != false){
                        musicPlayer.resume();
                      }else{
                        musicPlayer.pause();
                      } 
                      setState(() {
                        _isPlaying =!_isPlaying;

                      });
                    },
                    icon: Icon(
                      _isPlaying?Icons.play_arrow:Icons.pause,
                      color: Color(0xFF5E35B1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}