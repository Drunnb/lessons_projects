import 'package:flutter/material.dart';
import 'package:meditation_app/models/item_model.dart';
import 'package:just_audio/just_audio.dart';

class MeditationAppScreen extends StatefulWidget {
  MeditationAppScreen({Key? key}) : super(key: key);

  @override
  _MeditationAppScreenState createState() => _MeditationAppScreenState();
}

class _MeditationAppScreenState extends State<MeditationAppScreen> {
  final List<Item> items = [
    Item(
        name: 'Forest',
        imagePath: 'assets/meditation_images/forest.jpeg',
        audioPath: 'assets/meditation_audios/forest.mp3'),
    Item(
        name: 'Night',
        imagePath: 'assets/meditation_images/night.jpeg',
        audioPath: 'assets/meditation_audios/night.mp3'),
    Item(
        name: 'Ocean',
        imagePath: 'assets/meditation_images/ocean.jpeg',
        audioPath: 'assets/meditation_audios/ocean.mp3'),
    Item(
        name: 'Waterfall',
        imagePath: 'assets/meditation_images/waterfall.jpeg',
        audioPath: 'assets/meditation_audios/waterfall.mp3'),
    Item(
        name: 'Wind',
        imagePath: 'assets/meditation_images/wind.jpeg',
        audioPath: 'assets/meditation_audios/wind.mp3'),
  ];
  late AudioPlayer audioPlayer;
  int? playingIndex;

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemExtent: 100,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) => Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(items[index].imagePath), fit: BoxFit.cover),
            ),
            child: ListTile(
              title: Text('${items[index].name}'),
              leading: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  audioPlayer.setAsset(items[index].audioPath);
                  audioPlayer.play();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
