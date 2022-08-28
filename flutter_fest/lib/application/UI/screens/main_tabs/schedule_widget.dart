import 'package:flutter/material.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.sheduleBg),
          fit: BoxFit.none,
          alignment: Alignment.topLeft,
        ),
      ),
      child: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 1.5368852459,
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 84,
                      child: Image.asset(AppImages.sheduleFfLogo),
                    ),
                    Positioned(
                      right: 20,
                      top: 65,
                      child: Image.asset(AppImages.sheduleSurfLogo),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(color: Colors.pink, height: 150.0),
              Container(color: Colors.cyan, height: 150.0),
              Container(
                color: Colors.white.withOpacity(0.0),
                height: 150.0,
              ),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.pink, height: 150.0),
              Container(color: Colors.cyan, height: 150.0),
              Container(color: Colors.indigo, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
            ])),
          ],
        ),
      ),
    );
  }
}
