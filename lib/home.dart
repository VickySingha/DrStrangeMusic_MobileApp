import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool play = false;
  final player = AudioPlayer();
  var playState = "Play";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Color.fromARGB(255, 59, 59, 58),
                Color.fromARGB(255, 150, 149, 149)
              ],
            )),
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Hi Vicky",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Play Dr. Strange Music Today?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: SizedBox(
                    height: screenHeight * .4,
                    child: const Image(image: AssetImage("assets/ds.png"))),
              ),
              ElevatedButton(
                  onPressed: () {
                    play = !play;
                    playSong();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.orange,
                    elevation: 5,
                    minimumSize: const Size(150, 75),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "$playState Themes Musics",
                      style: const TextStyle(fontSize: 40),
                    ),
                  )),
            ])),
      ),
    );
  }

  playSong() {
    Random random = Random();
    int randomNumber = random.nextInt(3);
    if (play) {
      player.play(DeviceFileSource("assets/d$randomNumber.mp3"));
      setState(() {
        playState = "Stop";
      });
    } else {
      player.stop();
      setState(() {
        playState = "Play";
      });
    }
  }
}
