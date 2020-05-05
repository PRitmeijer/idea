import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mvc_application/view.dart' show StateMVC;
import 'package:idea/controller/controller.dart';

class RandomIdeas extends StatefulWidget {
  @override
  State createState() => _RandomIdeasState();
}

class _RandomIdeasState extends StateMVC<RandomIdeas> {
  _RandomIdeasState() : super(Controller()) {
    con = controller;
  }

  Controller con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LiquidSwipe(
          pages: con.deck,
          initialPage: 0,
          fullTransitionValue: 300,
          enableLoop: true,
          positionSlideIcon: 0.8,
          waveType: WaveType.liquidReveal,
          onPageChangeCallback: (page) => con.updateDeck(page),
        ));
  }
}