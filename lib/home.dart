import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

typedef void OnError(Exception exception);

class Hanuman_Chalisaa extends StatefulWidget {
  @override
  _Hanuman_Chalisaa createState() => _Hanuman_Chalisaa();
}

class _Hanuman_Chalisaa extends State<Hanuman_Chalisaa> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.black,
            body: Container(
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
              SizedBox(
                height: 50,
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
                  child: Image.asset(
                    'assets/wp5230452-hanuman-ji-full-hd-mobile-wallpapers.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "HANUMAN CHALISAA",
                style: TextStyle(fontSize: 22, color: Colors.red),
              ),
              Slider(
                  activeColor: Colors.amber[800],
                  inactiveColor: Colors.yellowAccent,
                  value: _position.inSeconds.toDouble(),
                  min: 0.0,
                  max: _duration.inSeconds.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      seekToSecond(value.toInt());
                      value = value;
                    });
                  }),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () => advancedPlayer.pause(),
                    icon: Icon(Icons.pause),
                    color: Colors.deepOrange,
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () => audioCache.play('1519293_128.mp3'),
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.deepOrange,
                    ),
                  ),
                  IconButton(
                    onPressed: () => advancedPlayer.stop(),
                    icon: Icon(Icons.stop),
                    color: Colors.deepOrange,
                  ),
                ],
              ),
            ])))));
  }
}
