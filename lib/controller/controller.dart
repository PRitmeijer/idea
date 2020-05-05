import 'package:flutter/material.dart';
import 'package:mvc_application/controller.dart' show ControllerMVC;
import 'package:idea/model/model.dart';

class Controller extends ControllerMVC {
  factory Controller() => _this ??= Controller._();
  static Controller _this;

  Controller._() {
    model = Model();
  }

  Model model;

  List<Container> get deck => model.deck;

  void updateDeck(int page) => model.updateDeck(page);
}