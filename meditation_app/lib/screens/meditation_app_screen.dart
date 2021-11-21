import 'package:flutter/material.dart';
import 'package:meditation_app/models/item_model.dart';

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
  final List<Color> itemsColors = <Color>[
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.purple
  ];

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
                  // height: 50,
                  color: itemsColors[index],
                  child: Text('${items[index].name}'),
                )),

        // child: ListView(
        //   children: [
        //     Container(
        //       height: 50,
        //       color: Colors.yellow,
        //       child: Text('${items[0].name}'),
        //     ),
        //     Container(
        //       height: 50,
        //       color: Colors.green,
        //       child: Text('${items[1].name}'),
        //     ),
        //     Container(
        //       height: 50,
        //       color: Colors.blue,
        //       child: Text('${items[2].name}'),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
