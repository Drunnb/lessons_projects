// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:noise_tool/bottom_bar/bottom_bar.dart';
import 'package:noise_tool/services/inform_to_screens.dart';
import '../services/all_routes.dart';

class HomeScreen extends StatefulWidget {
  final InformToScreens informToScreens;
  const HomeScreen(this.informToScreens, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isRecording = false;
  StreamSubscription<NoiseReading>? noiseSubscription;
  late NoiseMeter noiseMeter;
  double thisActualNoise = 0;

  List<double> listActualNoise = [0];

  @override
  void initState() {
    super.initState();
    noiseMeter = NoiseMeter(onError);
  }

  @override
  void dispose() {
    noiseSubscription?.cancel();
    super.dispose();
  }

  void onData(NoiseReading noiseReading) {
    setState(() {
      if (!isRecording) {
        isRecording = true;
      }
    });
    print(noiseReading.toString());
    thisActualNoise = noiseReading.maxDecibel;
    listActualNoise.add(thisActualNoise);
    if (listActualNoise.contains(0)) {
      listActualNoise.removeAt(0);
    }
  }

  void onError(Object error) {
    print(error.toString());
    isRecording = false;
  }

  void start() async {
    try {
      noiseSubscription = noiseMeter.noiseStream.listen(onData);
      setState(() {
        isRecording = true;
      });
    } catch (err) {
      print(err);
    }
  }

  void stop() async {
    try {
      if (noiseSubscription != null) {
        noiseSubscription!.cancel();
        noiseSubscription = null;
      }
      setState(() {
        isRecording = false;
      });
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(widget.informToScreens),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      widget.informToScreens.goToRoute(AllRoutes.info);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/icon_flash.png',
                        scale: 14.0,
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      widget.informToScreens.goToRoute(AllRoutes.settings);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/icon_settings.png',
                        scale: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150.0,
                    color: Colors.blue,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        thisActualNoise.toStringAsFixed(1),
                        style: const TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 80,
                          color: Color.fromARGB(255, 60, 60, 60),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Min ${listActualNoise.reduce(min).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Min ${listActualNoise.reduce(max).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
